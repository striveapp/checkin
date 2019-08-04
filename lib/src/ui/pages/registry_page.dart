import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/resources/lesson_repository.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:checkin/src/ui/components/attendees_list.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  LessonsBloc _lessonsBloc;
  AuthBloc _authBloc;
  UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _userBloc = BlocProvider.of<UserBloc>(context);
    _lessonsBloc = LessonsBloc(
        lessonRepository: _lessonsRepository, userRepository: _userRepository);
  }

  @override
  Widget build(BuildContext context) {
    final lessonId = ModalRoute.of(context).settings.arguments;
    User currentUser = (_userBloc.currentState as UserSuccess).currentUser;

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
        bloc: _lessonsBloc,
        builder: (BuildContext context, LessonsState state) {
          var _onPressedAcceptAll;
          var _onPressRegisterClass;
          var _onPressUnregisterClass;
          var currentLesson;

          if (state is LessonsUninitialized) {
            return LoadingIndicator();
          }
          if (state is LessonsLoaded) {
            state.lessons.forEach((lesson) {
              if (lesson.id == lessonId) {
                currentLesson = lesson;
                if (!currentLesson.containsUser(currentUser.email)) {
                  _onPressRegisterClass = () {
                    _lessonsBloc.dispatch(Register(
                        lessonId: lessonId,
                        attendee: Attendee.fromUser(currentUser)));
                  };
                } else {
                  _onPressUnregisterClass = () {
                    _lessonsBloc.dispatch(Unregister(
                        lessonId: lessonId,
                        attendee: Attendee.fromUser(currentUser)));
                  };
                }
              }
            });

            if (currentLesson.attendees != null) {
              _onPressedAcceptAll = currentLesson.attendees.isNotEmpty
                  ? () => _lessonsBloc.dispatch(ConfirmAttendees(
                      lessonId: lessonId, attendees: currentLesson.attendees))
                  : null;
            }

            return Center(
                child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                  AttendeesList(
                    attendeeList: currentLesson.attendees ?? [],
                    isOwner: _isOwnerUser(),
                    lessonId: lessonId,
                    lessonsBloc: _lessonsBloc,
                  ),
                  if (!_isOwnerUser() &&
                      !currentLesson.containsUser(currentUser.email))
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: RaisedButton(
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
                    ),
                  if (!_isOwnerUser() &&
                      currentLesson.containsUser(currentUser.email))
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: RaisedButton(
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
                    ),
                  if (_isOwnerUser())
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                    Localization.of(context).swipeToRemove,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Roboto",
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  if (_isOwnerUser())
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: RaisedButton(
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
                    ),
                  if (_isDevUser())
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
                        Navigator.pushNamedAndRemoveUntil(
                            context, "/", (route) => false);

                        _authBloc.dispatch(LogOut());
                      },
                    ),
                ])));
          }
          return ErrorWidget('Unknown State received in: registry_page');
        },
      ),
    );
  }

  bool _isDevUser() {
    return (_userBloc.currentState as UserSuccess).currentUser.isDev;
  }

  bool _isOwnerUser() {
    return (_userBloc.currentState as UserSuccess).currentUser.isOwner;
  }

  @override
  void dispose() {
    // todo capire meglio il problema Unhandled Exception: Bad state: Cannot add new events after calling close
    // è risuccesso da indagare!
    super.dispose();
    _lessonsBloc.dispose();
  }
}
