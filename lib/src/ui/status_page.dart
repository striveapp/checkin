import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/auth/auth_event.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/class/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/resources/class_repository.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'class_counter.dart';

class StatusPage extends StatefulWidget {
  final UserBloc userBloc;

  StatusPage({
    Key key,
    @required this.userBloc,
  }) : super(key: key);

  @override
  _StatusState createState() {
    return _StatusState();
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

class _StatusState extends State<StatusPage> {
  UserBloc get _userBloc => widget.userBloc;

  final ClassRepository _classRepository = ClassRepository();
  final UserRepository _userRepository = UserRepository();

  ClassBloc _classBloc;
  AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _classBloc = ClassBloc(
        classRepository: _classRepository, userRepository: _userRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: _getColor((_userBloc.currentState as UserSuccess).currentUser.rank),
          title: Text(Localization.of(context).status, style: TextStyle(
              fontSize: 24,
              letterSpacing: 0.8,
              fontFamily: "Roboto",
              color: ((_userBloc.currentState as UserSuccess).currentUser.rank == 'White') ? Colors.black : Colors.white,
              fontWeight: FontWeight.w600)),
          centerTitle: true,
        ),
        body: BlocBuilder(
          bloc: _classBloc,
          builder: (BuildContext context, ClassState state) {
            var _onPressed;
            var _currentUserEmail =
                (_authBloc.currentState as AuthAuthenticated).currentUserEmail;

            if (state is ClassLoaded) {
              var _isUserInClass = (currentUserEmail) =>
                  state.attendees.firstWhere(
                      (attendee) => attendee.email == currentUserEmail) ==
                  null;

              if (state.attendees.length == 0 ||
                  _isUserInClass(_currentUserEmail)) {
                _onPressed = () => _classBloc.dispatch(Attend(
                    attendee:
                        (_userBloc.currentState as UserSuccess).currentUser));
              }
            }

            return Center(
                child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: ClassCounter(
                        counter: (_userBloc.currentState as UserSuccess)
                            .currentUser
                            .counter),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: RaisedButton(
                      color: Colors.indigo,
                      child: Text(Localization.of(context).attendClass,
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
                    ),
                ])));
          },
        ));
  }

  @override
  void dispose() {
    _classBloc.dispose();
    super.dispose();
  }
}
