import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:checkin/src/ui/registry_page.dart';
import 'package:checkin/src/ui/login_page.dart';
import 'package:checkin/src/ui/splash_page.dart';
import 'package:checkin/src/ui/status_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {

  App({Key key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AuthBloc authBloc;
  UserRepository _userRepository;
  @override
  void initState() {
    _userRepository = new UserRepository();
    authBloc = AuthBloc(auth: FirebaseAuth.instance, userRepository: _userRepository);
    authBloc.dispatch(AppStarted());
    super.initState();
  }

  @override
  void dispose() {
    authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      bloc: authBloc,
      child: MaterialApp(
        home: BlocBuilder<AuthEvent, AuthState>(
          bloc: authBloc,
          builder: (BuildContext context, AuthState state) {
            if (state is AuthUninitialized) {
              return SplashPage();
            }
            if (state is AuthAuthenticated) {
              if(state.user.isOwner)
                return RegistryPage();
              else
                return StatusPage();
            }
            if (state is AuthUnauthenticated) {
              return LoginPage();
            }
          },
        ),
      ),
    );
  }
}
