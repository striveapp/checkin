import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/auth/auth_event.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/class/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
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
          title: Text("Status", style: TextStyle(
              fontSize: 24,
              letterSpacing: 0.8,
              fontFamily: "Roboto",
              color: Colors.white,
              fontWeight: FontWeight.w600)),
          centerTitle: true,
        ),
        body: BlocBuilder(
          bloc: _classBloc,
          builder: (BuildContext context, ClassState state) {
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
                      //@TODO: should disable the button if already attending class
                      child: Text('Attend class',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Roboto",
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                      onPressed: () {
                        _classBloc.dispatch(Attend(
                            attendee: (_userBloc.currentState as UserSuccess)
                                .currentUser));
                      },
                    ),
                  ),
                  RaisedButton(
                    color: Colors.red,
                    child: Text('Logout',
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
