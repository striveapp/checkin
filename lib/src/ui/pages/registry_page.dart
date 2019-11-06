import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/resources/lesson_repository.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:checkin/src/ui/components/attendees_list.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/masters_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../util.dart';

class RegistryPage extends StatefulWidget {
  RegistryPage({
    Key key,
  }) : super(key: key);

  @override
  _RegistryState createState() {
    return _RegistryState();
  }
}

class _RegistryState extends State<RegistryPage> {
  final LessonRepository _lessonsRepository = LessonRepository();
  final UserRepository _userRepository = UserRepository();
  RegistryBloc _registryBloc;
  AuthBloc _authBloc;
  UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _userBloc = BlocProvider.of<UserBloc>(context);
    _registryBloc = RegistryBloc(
        lessonRepository: _lessonsRepository, userRepository: _userRepository);
  }

  @override
  Widget build(BuildContext context) {
    final lessonId = ModalRoute.of(context).settings.arguments;
    _registryBloc.dispatch(LoadLesson(lessonId: lessonId));
    
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(Localization.of(context).registry,
            style: TextStyle(
                fontSize: 24,
                letterSpacing: 0.8,
                fontFamily: "Roboto",
                color: Colors.white,
                fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: BlocBuilder(
        bloc: _registryBloc,
        builder: (BuildContext context, RegistryState state) {
          var _onPressedAcceptAll;
          var _onPressRegisterClass;
          var _onPressUnregisterClass;

          if (state is RegistryUninitialized || state is RegistryLoading ) {
            return LoadingIndicator();
          }

          if (state is RegistryLoaded) {
            // todo should refactor to never use _userBloc.currentState, are we reactive yet?
            User currentUser = (_userBloc.currentState as UserSuccess)
                .currentUser;

            Lesson currentLesson = state.lesson;

            if (!currentLesson.containsUser(currentUser.email)) {
              _onPressRegisterClass = () {
                _registryBloc.dispatch(Register(
                    lessonId: lessonId,
                    attendee: Attendee.fromUser(currentUser)));
              };
            } else {
              //TODO: this will not work if the user changes his infos first and then attempt to unregister
              _onPressUnregisterClass = () {
                  _removeAttendee(lessonId, Attendee.fromUser(currentUser));
              };
            }

            if (currentLesson.attendees != null) {
              _onPressedAcceptAll = currentLesson.attendees.isNotEmpty
                  ? () => _registryBloc.dispatch(ConfirmAttendees(
                  lesson: currentLesson))
                  : null;
            }

            return Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                    if (currentLesson.masters != null && currentLesson.masters.length > 0)
                      MastersList(
                        masters: currentLesson.masters,
                      ),
                    Column(
                      children: <Widget>[
                        AttendeesList(
                          attendeeList: currentLesson.attendees ?? [],
                          isOwner: _isOwnerUser(),
                          lessonId: lessonId,
                          removeAttendee: (Attendee attendee) {
                            _removeAttendee(lessonId, attendee);
                          },
                        ),
                        if (_isOwnerUser())
                          Text(
                            Localization.of(context).swipeToRemove,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Roboto",
                              color: Colors.black54,
                            ),
                          ),
                      ],
                    ),
                    if (!_isOwnerUser() &&
                        !currentLesson.containsUser(currentUser.email))
                      RaisedButton(
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text(Localization.of(context).registerClass,
                              key: Key('attendClass'),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Roboto",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ),
                        onPressed: _onPressRegisterClass,
                      ),
                        if (!_isOwnerUser() &&
                            currentLesson.containsUser(currentUser.email))
                          RaisedButton(
                            color: Colors.red,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(Localization.of(context).unregisterClass,
                                  key: Key('unattendClass'),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Roboto",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                            ),
                            onPressed: _onPressUnregisterClass,
                          ),
                    if (_isOwnerUser())
                      RaisedButton(
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text(Localization.of(context).acceptAll,
                              key: Key('acceptAll'),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Roboto",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ),
                        onPressed: _onPressedAcceptAll,
                      ),
                    if (isInDebugMode)
                      RaisedButton(
                        key: Key('logoutButton'),
                        color: Colors.red,
                        child: Text(Localization.of(context).logout,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                        onPressed: () {
                          //TODO: check if a best solution can be applied here: https://github.com/felangel/bloc/issues/400
                          //TODO: we checked and is not enough
                          debugPrint("Logging out from registry!");
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/", (route) => false);
                          _authBloc.dispatch(LogOut());
                        },
                      ),
                  ]),
                ));
          }
          return ErrorWidget('Unknown State received in: registry_page');
        },
      ),
    );
  }

  void _removeAttendee(lessonId, Attendee attendee) {
    _registryBloc.dispatch(Unregister(
        lessonId: lessonId,
        attendee: attendee));
  }

  bool _isOwnerUser() {
    return (_userBloc.currentState as UserSuccess).currentUser.isOwner;
  }

  @override
  void dispose() {
    // todo capire meglio il problema Unhandled Exception: Bad state: Cannot add new events after calling close
    // è risuccesso da indagare!
    super.dispose();
    _registryBloc.dispose();
  }
}
