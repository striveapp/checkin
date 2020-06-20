import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/ui/components/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  final AnalyticsRepository _analyticsRepository;

  LoginPage({
    Key key,
    @required AuthRepository authRepository,
    @required UserRepository userRepository,
    @required AnalyticsRepository analyticsRepository,
  })  : assert(authRepository != null &&
            userRepository != null &&
            analyticsRepository != null),
        _authRepository = authRepository,
        _userRepository = userRepository,
        _analyticsRepository = analyticsRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
      alignment: Alignment.center,
      decoration: new BoxDecoration(
          image: new DecorationImage(
        image: new AssetImage("assets/images/trianglify.png"),
        fit: BoxFit.cover,
      )),
      child: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(
          userRepository: _userRepository,
          authRepository: _authRepository,
          analyticsRepository: _analyticsRepository,
        ),
        child: LoginForm(),
      ),
    ));
  }
}
