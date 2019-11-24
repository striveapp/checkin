import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/resources/auth_repository.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:checkin/src/routes/application.dart';
import 'package:checkin/src/routes/routes.dart';
import 'package:checkin/src/simple_bloc_delegate.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app.dart';

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

  runZoned<Future<void>>(() async {
    runApp(
      BlocProvider<AuthBloc>(
        create: (context) =>
            AuthBloc(authRepository: authRepository)..add(AppStarted()),
        child: App(
          userRepository: userRepository,
          authRepository: authRepository,
        ),
      ),
    );
  }, onError: Crashlytics.instance.recordError);
}
