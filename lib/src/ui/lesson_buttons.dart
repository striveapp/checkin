import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/class/bloc.dart';
import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/resources/lesson_repository.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading_indicator.dart';

class LessonsButtons extends StatefulWidget {
  final List<Lesson> lessons;
  final UserBloc userBloc;

  LessonsButtons({
    Key key,
    @required this.lessons,
    @required this.userBloc,
  }) : super(key: key);

  @override
  State<LessonsButtons> createState() => _LessonsButtonsState();
}

class _LessonsButtonsState extends State<LessonsButtons> {
  List<Lesson> get _lessons => widget.lessons;

  UserBloc get _userBloc => widget.userBloc;

  final UserRepository _userRepository = UserRepository();
  final LessonRepository _lessonRepository = LessonRepository();

  LessonsBloc _lessonBloc;

  @override
  void initState() {
    super.initState();

    _lessonBloc = LessonsBloc(
        lessonRepository: _lessonRepository, userRepository: _userRepository);
  }

  @override
  void dispose() {
    _lessonBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _lessonBloc,
      builder: (BuildContext context, LessonsState state) {
        var _onPressed;

        if (state is LessonsLoaded) {
          try {
            User currentUser =
                (_userBloc.currentState as UserSuccess).currentUser;

            _onPressed = (lessonId) => _lessonBloc.dispatch(AttendLesson(
                lessonId: lessonId, attendee: Attendee.fromUser(currentUser)));

            return Container(
                margin: EdgeInsets.only(top: 40.0),
                child: Column(
                    children: _lessons
                        .map((lesson) => Container(
                            padding: EdgeInsets.only(top: 20.0),
                            child: ButtonTheme(
                                height: 50.0,
                                minWidth: 240.0,
                                buttonColor: Colors.indigo,
                                padding: const EdgeInsets.all(0.0),
                                child: RaisedButton(
                                    child: Text(
                                      "${lesson.timeStart} - ${lesson.timeEnd}",
                                      key: Key('${lesson.name}'),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.normal,
                                          fontFamily: 'Roboto',
                                          fontSize: 22.0),
                                    ),
                                    onPressed:
                                        lesson.containsUser(currentUser.name)
                                            ? null
                                            : () => _onPressed(lesson.id)))))
                        .toList()));
          } catch (e) {
            debugPrint(e);
            return ErrorWidget('Unknown State received in: lesson_buttons');
          }
        }

        if (state is LessonsUninitialized) {
          return LoadingIndicator();
        }

        return ErrorWidget('Unknown State received in: lesson_buttons');
      },
    );
  }
}