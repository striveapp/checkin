import 'dart:async';
import 'dart:io';

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
  NotificationBloc _notificationsBloc;

  FirebaseMessaging _fcm;

  StreamSubscription iosSubscription;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc(auth: FirebaseAuth.instance);
    _userBloc = UserBloc(authBloc: _authBloc, userRepository: UserRepository());
    _notificationsBloc = NotificationBloc();

    _fcm = FirebaseMessaging();

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        _notificationsBloc.dispatch(ShowDialog(message: message));
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // TODO optional
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // TODO optional
      },
    );
  }

  @override
  void dispose() {
    _authBloc.dispose();
    _userBloc.dispose();
    iosSubscription.cancel();
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
          '/registry': (context) => RegistryPage(),
        },
        home: BlocListener(
            bloc: _notificationsBloc,
            listener: (BuildContext context, NotificationState state) {
              if (state is NotificationMessage) {
                print("showDialog!");
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: ListTile(
                      title: Text(state.message['notification']['title']),
                      subtitle: Text(state.message['notification']['body']),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Ok'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                );
              }
            },
            child: BlocBuilder<AuthEvent, AuthState>(
              bloc: _authBloc,
              builder: (BuildContext context, AuthState state) {
                if (state is AuthUninitialized) {
                  return SplashPage();
                }
                if (state is AuthAuthenticated) {
                  _setupNotifications();
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
    );
  }

  /// Get the token, save it to the database for current user
  void _saveDeviceToken() async {
    // Get the token for this device
    String fcmToken = await _fcm.getToken();

    _userBloc.dispatch(UpdateFcmToken(token: fcmToken));
  }

  void _setupNotifications() {
    if (Platform.isIOS) {
      iosSubscription = _fcm.onIosSettingsRegistered.listen((data) {
        _saveDeviceToken();
      });

      _fcm.requestNotificationPermissions(IosNotificationSettings());
    } else {
      _saveDeviceToken();
    }
  }
}
