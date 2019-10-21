import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/auth/auth_event.dart';
import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/resources/lesson_repository.dart';
import 'package:checkin/src/ui/components/lesson_card.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../util.dart';

class LessonsPage extends StatefulWidget {
  final UserBloc userBloc;

  LessonsPage({
    Key key,
    @required this.userBloc,
  }) : super(key: key);

  @override
  _LessonsState createState() => _LessonsState();
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

  LessonsBloc _lessonsBloc;
  AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _lessonsBloc = LessonsBloc(
        lessonRepository: _lessonRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: _getColor(
              (_userBloc.currentState as UserSuccess).currentUser.rank),
          title: Text(Localization.of(context).lessons,
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
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                  key: Key('profilePageButton'),
                  onPressed: () {
                    String email = (_userBloc.currentState as UserSuccess).currentUser.email;
                    Navigator.of(context).pushNamed('profile/$email');
                  },
                  icon: UserImage(userImage: (_userBloc.currentState as UserSuccess).currentUser.imageUrl, width: 30, height: 30,)
    ),
            ),
          ],
        ),
        body: BlocBuilder(
            bloc: _lessonsBloc,
            builder: (BuildContext context, LessonsState state) {
              if (state is LessonsUninitialized) {
                return LoadingIndicator();
              }
              if (state is LessonsLoaded) {
                return Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          Localization.of(context).todaysClasses,
                          key: Key('todaysClassesText'),
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                              fontSize: 32.0),
                        ),
                      ),
                      Container(
                        child: Expanded(
                          child: ListView(
                              children: state.lessons
                                  .map((lesson) => LessonCard(lesson: lesson))
                                  .toList()),
                        ),
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
                            _authBloc.dispatch(LogOut());
                          },
                        ),
                    ],
                  ),
                );
              }
              return ErrorWidget('Unknown State received in: lesson_page');
            }));
  }

  @override
  void dispose() {
    _lessonsBloc.dispose();
    super.dispose();
  }
}
