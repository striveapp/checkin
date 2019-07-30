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

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _lessonsBloc = LessonsBloc(
        lessonRepository: _lessonsRepository, userRepository: _userRepository);
  }

  @override
  Widget build(BuildContext context) {
    final lessonId = ModalRoute.of(context).settings.arguments;
    UserBloc _userBloc = BlocProvider.of<UserBloc>(context);
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
          var _onPressAttendClass;
          var currentLesson;
          if (state is LessonsUninitialized) {
            return LoadingIndicator();
          }
          if (state is LessonsLoaded) {
            state.lessons.forEach((lesson) {
                if (lesson.id == lessonId) {
                  currentLesson = lesson;
                  _onPressAttendClass = !currentLesson.containsUser(currentUser.email)
                        ? () => _lessonsBloc.dispatch(AttendLesson(
                        lessonId: lessonId, attendee: Attendee.fromUser(currentUser)))
                        : null;
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: AttendeesList(
                        attendeeList: currentLesson.attendees ?? []),
                  ),
                  if (!(_userBloc.currentState as UserSuccess).currentUser.isOwner)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: RaisedButton(
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(Localization.of(context).attendClass,
                            key: Key('attendClass'),
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Roboto",
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ),
                      onPressed: _onPressAttendClass,
                    ),
                  ),
                  if ((_userBloc.currentState as UserSuccess).currentUser.isOwner)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
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
                  if ((_userBloc.currentState as UserSuccess).currentUser.isDev)
                    RaisedButton(
                      key: Key('logoutButton'),
                      color: Colors.red,
                      child: Text(Localization.of(context).logout,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                      onPressed: () {
                        // todo why does this work?
                        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);

                        _authBloc.dispatch(LogOut());
                      },
                    )
                ])));
          }
          return ErrorWidget('Unknown State received in: registry_page');
        },
      ),
    );
  }

  @override
  void dispose() {
    // todo capire meglio il problema Unhandled Exception: Bad state: Cannot add new events after calling close
    // è risuccesso da indagare!
    super.dispose();
    _lessonsBloc.dispose();
  }
}
