import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/dynamic_link/bloc.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/routes/application.dart';
import 'package:checkin/src/routes/routes.dart';
import 'package:checkin/src/simple_bloc_delegate.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app.dart';
import 'src/blocs/dynamic_link/dynamic_link_event.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // init bloc delegate
  BlocSupervisor.delegate = SimpleBlocDelegate();

  // setup crashlytics
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  // init routes
  Routes.configureRoutes(Application.router);

  // init repositories
  final AuthRepository authRepository = AuthRepository();
  final UserRepository userRepository = UserRepository();
  final FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  runZoned<Future<void>>(() async {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc(authRepository: authRepository)..add(AppStarted()),
          ),
          BlocProvider<DynamicLinkBloc>(
            create: (context) => DynamicLinkBloc(dynamicLinks: dynamicLinks)..add(DeepLinkSetup()),
          ),
        ],
        child: App(
          userRepository: userRepository,
          authRepository: authRepository,
        ),
      ),
    );
  }, onError: Crashlytics.instance.recordError);
}
