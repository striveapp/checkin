import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/resources/lesson_repository.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'lesson_buttons.dart';
import 'loading_indicator.dart';

class LessonsPage extends StatefulWidget {
  final UserBloc userBloc;

  LessonsPage({
    Key key,
    @required this.userBloc,
  }) : super(key: key);

  @override
  _LessonsState createState() {
    return _LessonsState();
  }
}

_getColor(String grade) {
  switch (grade) {
    case 'White':
      return Colors.white;
    case 'Blue':
      return Colors.blueAccent;
    case 'Purple':
      return Colors.purple;
    case 'Brown':
      return Colors.brown;
    case 'Black':
      return Colors.black87;
  }
}

class _LessonsState extends State<LessonsPage> {
  UserBloc get _userBloc => widget.userBloc;

  final LessonRepository _lessonRepository = LessonRepository();
  final UserRepository _userRepository = UserRepository();

  LessonsBloc _lessonsBloc;

  @override
  void initState() {
    super.initState();
    _lessonsBloc = LessonsBloc(
        lessonRepository: _lessonRepository, userRepository: _userRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: _getColor(
              (_userBloc.currentState as UserSuccess).currentUser.rank),
          title: Text(Localization.of(context).status,
              style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 0.8,
                  fontFamily: "Roboto",
                  color: ((_userBloc.currentState as UserSuccess)
                              .currentUser
                              .rank ==
                          'White')
                      ? Colors.black
                      : Colors.white,
                  fontWeight: FontWeight.w600)),
          centerTitle: true,
        ),
        body: BlocBuilder(
            bloc: _lessonsBloc,
            builder: (BuildContext context, LessonsState state) {
              if (state is LessonsUninitialized) {
                return LoadingIndicator();
              }
              if (state is LessonsLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        Localization.of(context).todaysClasses,
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                            fontSize: 32.0),
                      ),
                    ),
                    LessonsButtons(lessons: state.lessons)
                  ],
                );
              }
            }));
  }

  @override
  void dispose() {
    _lessonsBloc.dispose();
    super.dispose();
  }
}
