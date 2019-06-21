import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/auth/auth_state.dart';
import 'package:checkin/src/blocs/class/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/resources/class_repository.dart';
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

  final ClassRepository _classRepository = ClassRepository();
  final UserRepository _userRepository = UserRepository();
  AuthBloc _authBloc;
  ClassBloc _classBloc;

  @override
  void initState() {
    super.initState();

    _authBloc = BlocProvider.of<AuthBloc>(context);

    _classBloc = ClassBloc(
        classRepository: _classRepository, userRepository: _userRepository);
  }

  @override
  void dispose() {
    _classBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _classBloc,
      builder: (BuildContext context, ClassState state) {
        var _onPressed;
        var _currentUserEmail = (_authBloc.currentState as AuthAuthenticated).currentUserEmail;

        if(state is ClassLoaded) {
          var _isUserInClass = (currentUserEmail) =>
          state.attendees.firstWhere((attendee) =>
          attendee.email == currentUserEmail) == null;

          if (state.attendees.length == 0 || _isUserInClass(_currentUserEmail)) {
            _onPressed = () => _classBloc.dispatch(Attend(attendee: (_userBloc.currentState as UserSuccess).currentUser));
          }

          return Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Column(
                  children: _lessons.map((lesson) =>
                      Container(
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
                                        fontSize: 22.0
                                    ),
                                  ),
                                  onPressed: _onPressed))))
                      .toList()));

        }

        if( state is ClassUninitialized ) {
          return LoadingIndicator();
        }

        return ErrorWidget('Unknown State received in: lesson_buttons');
      },
    );
  }
}