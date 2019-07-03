import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/resources/lesson_repository.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:checkin/src/ui/attendees_list.dart';
import 'package:checkin/src/ui/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistryPage extends StatefulWidget {
  final UserBloc userBloc;

  RegistryPage({
    Key key,
    @required this.userBloc,
  }) : super(key: key);

  @override
  _RegistryState createState() {
    return _RegistryState();
  }
}

class _RegistryState extends State<RegistryPage> {
  UserBloc get _userBloc => widget.userBloc;

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
          var _onPressed;
          var currentLesson;
          if (state is LessonsUninitialized) {
            return LoadingIndicator();
          }
          if (state is LessonsLoaded) {
            state.lessons.forEach((lesson) => {
                  if (lesson.id == lessonId) {currentLesson = lesson}
                });

            if (currentLesson.attendees != null) {
              _onPressed = currentLesson.attendees.isNotEmpty
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: RaisedButton(
                      color: Colors.indigo,
                      child: Text(Localization.of(context).acceptAll,
                          key: Key('acceptAll'),
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Roboto",
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                      onPressed: _onPressed,
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
    _lessonsBloc.dispose();
    super.dispose();
  }
}
