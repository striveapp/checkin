import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:checkin/src/ui/grade_page.dart';
import 'package:checkin/src/ui/home_page.dart';
import 'package:checkin/src/ui/login_page.dart';
import 'package:checkin/src/ui/splash_page.dart';
import 'package:checkin/src/ui/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'blocs/user/bloc.dart';
import 'localization/localization.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AuthBloc _authBloc;
  UserBloc _userBloc;

  @override
  void initState() {
    _authBloc = AuthBloc(auth: FirebaseAuth.instance);
    _userBloc = UserBloc(authBloc: _authBloc, userRepository: UserRepository());
    super.initState();
  }

  @override
  void dispose() {
    _authBloc.dispose();
    _userBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //@TODO: Manage incosistent situation when no user is present but is still logged in
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<AuthBloc>(bloc: _authBloc),
        BlocProvider<UserBloc>(bloc: _userBloc)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          const LocalizationDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('es', ''),
        ],
        routes: {
          '/home': (context) => HomePage(),
          '/profile': (context) => ProfilePage(),
        },
        home: BlocBuilder<AuthEvent, AuthState>(
          bloc: _authBloc,
          builder: (BuildContext context, AuthState state) {
            if (state is AuthUninitialized) {
              return SplashPage();
            }
            if (state is AuthAuthenticated) {
              if (state.isFirstLogin) {
                return GradePage();
              } else {
                return HomePage();
              }
            }
            if (state is AuthUnauthenticated) {
              return LoginPage();
            }

            return ErrorWidget('Unknown State received in: app');
          },
        ),
      ),
    );
  }
}
