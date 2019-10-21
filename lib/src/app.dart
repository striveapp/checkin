import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:checkin/src/routes/application.dart';
import 'package:checkin/src/routes/routes.dart';
import 'package:checkin/src/ui/components/notification_toast.dart';
import 'package:checkin/src/ui/pages/grade_page.dart';
import 'package:checkin/src/ui/pages/home_page.dart';
import 'package:checkin/src/ui/pages/login_page.dart';
import 'package:checkin/src/ui/pages/splash_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:platform/platform.dart';

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
    Routes.configureRoutes(Application.router);
    _authBloc = AuthBloc(auth: FirebaseAuth.instance);
    _userBloc = UserBloc(authBloc: _authBloc, userRepository: UserRepository());
    _notificationsBloc = NotificationsBloc(
        notificationProvider: FirebaseMessaging(), userBloc: _userBloc, platform: LocalPlatform());
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
        onGenerateRoute: Application.router.generator,
        initialRoute: '/',
        home: Scaffold(
          body: BlocListener(
              bloc: _notificationsBloc,
              listener: (BuildContext context, NotificationsState state) {
                if (state is BasicNotificationsLoaded) {
                  NotificationToast.show(context, state.notification.title,
                      state.notification.body);
                }
                if(state is ActionNotificationsLoaded) {
                  Navigator.of(context).pushNamed('registry', arguments: state.lessonId);
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
