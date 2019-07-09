import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading_indicator.dart';

class LessonsButtons extends StatefulWidget {
  final List<Lesson> lessons;
  final UserBloc userBloc;
  final LessonsBloc lessonsBloc;

  LessonsButtons({
    Key key,
    @required this.lessons,
    @required this.userBloc,
    @required this.lessonsBloc,
  }) : super(key: key);

  @override
  State<LessonsButtons> createState() => _LessonsButtonsState();
}

class _LessonsButtonsState extends State<LessonsButtons> {
  List<Lesson> get _lessons => widget.lessons;
  UserBloc get _userBloc => widget.userBloc;
  LessonsBloc get _lessonBloc => widget.lessonsBloc;

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

            _onPressed = (lessonId) {
              if(currentUser.isOwner) {
                Navigator.of(context).pushNamed('/registry', arguments: lessonId);
              } else {
                _lessonBloc.dispatch(AttendLesson(
                    lessonId: lessonId, attendee: Attendee.fromUser(currentUser)));
              }
            };

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
                                        lesson.containsUser(currentUser.email)
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