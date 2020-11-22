import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/local_storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/ui/components/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final AuthRepository _authRepository;

  LoginPage({
    Key key,
    @required AuthRepository authRepository,
  })  : assert(authRepository != null ),
        _authRepository = authRepository,
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
          authRepository: _authRepository,
          userRepository: context.read<UserRepository>(),
          analyticsRepository: context.read<AnalyticsRepository>(),
          localStorageRepository: context.read<LocalStorageRepository>(),
        ),
        child: LoginForm(),
      ),
    ));
  }
}
