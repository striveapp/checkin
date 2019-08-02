import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:checkin/src/ui/pages/grade_page.dart';
import 'package:checkin/src/ui/pages/home_page.dart';
import 'package:checkin/src/ui/pages/login_page.dart';
import 'package:checkin/src/ui/pages/registry_page.dart';
import 'package:checkin/src/ui/pages/splash_page.dart';
import 'package:checkin/src/ui/pages/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'blocs/notifications/bloc.dart';
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
  NotificationsBloc _notificationsBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc(auth: FirebaseAuth.instance);
    _userBloc = UserBloc(authBloc: _authBloc, userRepository: UserRepository());
    _notificationsBloc = NotificationsBloc(
        notificationProvider: FirebaseMessaging(), userBloc: _userBloc);
  }

  @override
  void dispose() {
    _authBloc.dispose();
    _userBloc.dispose();
    _notificationsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //@TODO: Manage incosistent situation when no user is present but is still logged in
    return BlocProviderTree(
      blocProviders: [
        BlocProvider<AuthBloc>(bloc: _authBloc),
        BlocProvider<UserBloc>(bloc: _userBloc),
        BlocProvider<NotificationsBloc>(bloc: _notificationsBloc),
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
          '/registry': (context) => RegistryPage(),
        },
        home: Scaffold(
          body: BlocListener(
              bloc: _notificationsBloc,
              listener: (BuildContext context, NotificationsState state) {
                if (state is NotificationsMessage) {
                  //TODO: this should be evenutally moved out into his own Widget,
                  // i've tried that, but it's pretty damn complicated, maybe we should use https://pub.dev/packages/flushbar ?
                  final snackBar = SnackBar(
                    content: ListTile(
                      title: Text(state.message['notification']['title']),
                      subtitle: Text(state.message['notification']['body']),
                    ),
                    action: SnackBarAction(
                      label: 'Close',
                      onPressed: () {
                        debugPrint("close");
                      },
                    ),
                  );
                  print('Show SnackBar');
                  Scaffold.of(context).showSnackBar(snackBar);
                }
              },
              child: BlocBuilder<AuthEvent, AuthState>(
                bloc: _authBloc,
                builder: (BuildContext context, AuthState state) {
                  if (state is AuthUninitialized) {
                    return SplashPage();
                  }
                  if (state is AuthAuthenticated) {
                    _notificationsBloc.dispatch(Setup());
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
              )),
        ),
      ),
    );
  }
}
