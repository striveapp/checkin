import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:checkin/src/resources/auth_repository.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:checkin/src/ui/components/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  LoginPage({
    Key key,
    @required AuthRepository authRepository,
    @required UserRepository userRepository,
  }) : assert(authRepository != null && userRepository != null),
        _authRepository = authRepository,
        _userRepository = userRepository,
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
            create: (context) => LoginBloc(userRepository: _userRepository, authRepository: _authRepository),
            child: LoginForm(),
          ),
        ));
  }
}
