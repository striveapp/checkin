import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:checkin/src/ui/components/grade_buttons.dart';
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
  AuthBloc _authBloc;
  UserRepository _userRepository;

  @override
  void initState() {
    super.initState();
    _userRepository = UserRepository();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _userBloc = UserBloc(authBloc: _authBloc, userRepository: _userRepository);
  }

  @override
  Widget build(BuildContext context) {
    // todo lo user bloc non serve a un cazzo
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
                      Localization.of(context).beltSelection,
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