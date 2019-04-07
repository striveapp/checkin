import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:checkin/src/ui/grade_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GradePage extends StatefulWidget {
  GradePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GradePageState createState() {
    return _GradePageState();
  }
}

class _GradePageState extends State<GradePage> {
  UserBloc _userBloc;
  UserRepository _userRepository;

  @override
  void initState() {
    super.initState();
    _userRepository = UserRepository();
    _userBloc = UserBloc(userRepository: _userRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder(
            bloc: _userBloc,
            builder: (BuildContext context, UserState state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'What\'s your belt?',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          fontSize: 32.0),
                    ),
                  ),
                  GradeButtons(userBloc: _userBloc)
                ],
              );
            }));
  }

  @override
  void dispose() {
    _userBloc.dispose();
    super.dispose();
  }
}