import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/api/api.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/dynamic_link/bloc.dart';
import 'package:checkin/src/blocs/version/bloc.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/repositories/version_repository.dart';
import 'package:checkin/src/resources/lesson_instances_provider.dart';
import 'package:checkin/src/routes/application.dart';
import 'package:checkin/src/routes/routes.dart';
import 'package:checkin/src/simple_bloc_delegate.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/app.dart';
import 'src/blocs/dynamic_link/dynamic_link_event.dart';

void main(NavigatorObserver navigatorObserver) {
  _main(null);
}

void mainTest(NavigatorObserver navigatorObserver) {
  _main(navigatorObserver);
}

void _main(NavigatorObserver navigatorObserver) {
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
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<LessonRepository>(
            create: (context) => LessonInstancesProvider(),
          ),
          RepositoryProvider<LessonApi>(
            create: (context) => LessonApi(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (context) =>
                  AuthBloc(authRepository: authRepository)..add(AppStarted()),
            ),
            BlocProvider<DynamicLinkBloc>(
              create: (context) => DynamicLinkBloc(dynamicLinks: dynamicLinks)
                ..add(DeepLinkSetup()),
            ),
            BlocProvider<VersionBloc>(
                create: (context) =>
                    VersionBloc(versionRepository: VersionRepository())),
          ],
          child: App(
            userRepository: userRepository,
            authRepository: authRepository,
            navigationObserver: navigatorObserver,
          ),
        ),
      ),
    );
  }, onError: Crashlytics.instance.recordError);
}
