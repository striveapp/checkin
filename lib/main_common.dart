import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/app_config.dart';
import 'package:checkin/src/api/lesson_api.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/dynamic_link/bloc.dart';
import 'package:checkin/src/blocs/theme/bloc.dart';
import 'package:checkin/src/blocs/version/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/dynamic_link_repository.dart';
import 'package:checkin/src/repositories/graduation_system_repository.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/lesson_config_repository.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/repositories/local_storage_repository.dart';
import 'package:checkin/src/repositories/membership_repository.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/repositories/version_repository.dart';
import 'package:checkin/src/resources/analytics_provider.dart';
import 'package:checkin/src/resources/auth_provider.dart';
import 'package:checkin/src/resources/dynamic_link_provider.dart';
import 'package:checkin/src/resources/graduation_system_provider.dart';
import 'package:checkin/src/resources/lesson_config_provider.dart';
import 'package:checkin/src/resources/lesson_instances_provider.dart';
import 'package:checkin/src/resources/local_storage_provider.dart';
import 'package:checkin/src/resources/membership_provider.dart';
import 'package:checkin/src/resources/stats_provider.dart';
import 'package:checkin/src/resources/user_provider.dart';
import 'package:checkin/src/routes/application.dart';
import 'package:checkin/src/routes/routes.dart';
import 'package:checkin/src/simple_bloc_observer.dart';
import 'package:checkin/src/util/version_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'src/app.dart';
import 'src/blocs/dynamic_link/dynamic_link_event.dart';

Future<void> mainCommon(AppConfig appConfig) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // init bloc delegate
  Bloc.observer = SimpleBlocObserver();

  // setup crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  // init routes
  Routes.configureRoutes(Application.router);

  // init repositories
  final StorageRepository storageRepository = StorageRepository();
  final ImageRepository imageRepository = ImageRepository();

  final AuthRepository authProvider = AuthProvider(appConfig: appConfig);

  final user = await _getLoggedUser(authProvider);
  await _precacheAssets();

  runZonedGuarded<Future<void>>(() async {
    runApp(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<LessonRepository>(
            create: (context) => LessonInstancesProvider(),
          ),
          RepositoryProvider<AuthRepository>(
            create: (context) => authProvider,
          ),
          RepositoryProvider<DynamicLinkRepository>(
            create: (context) => DynamicLinkProvider(appConfig: appConfig),
          ),
          RepositoryProvider<LessonApi>(
            create: (context) => LessonApi(),
          ),
          RepositoryProvider<AnalyticsRepository>(
            create: (context) => AnalyticsProvider(),
          ),
          RepositoryProvider<UserRepository>(
            create: (context) => UserProvider(),
          ),
          RepositoryProvider<StatsRepository>(
            create: (context) => StatsProvider(),
          ),
          RepositoryProvider<MembershipRepository>(
            create: (context) => MembershipProvider(),
          ),
          RepositoryProvider<GraduationSystemRepository>(
            create: (context) => GraduationSystemProvider(),
          ),
          RepositoryProvider<LocalStorageRepository>(
            create: (context) => LocalStorageProvider(),
          ),
          RepositoryProvider<VersionRepository>(
            create: (context) => VersionRepository(),
          ),
          RepositoryProvider<LessonConfigRepository>(
            create: (context) => LessonConfigProvider(),
          )
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ThemeBloc>(
              create: (context) => ThemeBloc(),
            ),
            BlocProvider<AuthBloc>(
              create: (context) => AuthBloc(
                  authRepository: context.read<AuthRepository>(),
                  analyticsRepository: context.read<AnalyticsRepository>(),
                  userRepository: context.read<UserRepository>(),
                  localStorageRepository: context.read<LocalStorageRepository>(),
                  loggedUser: user, // todo retrieve from storage cache
                  versionUtil: VersionUtil())
                ..add(AppStarted()),
            ),
            BlocProvider<DynamicLinkBloc>(
              create: (context) => DynamicLinkBloc(
                  dynamicLinks: FirebaseDynamicLinks.instance,
                  localStorageRepository: context.read<LocalStorageRepository>(),
                  dynamicLinkRepository: context.read<DynamicLinkRepository>(),
                  authRepository: context.read<AuthRepository>(),
                  analyticsRepository: context.read<AnalyticsRepository>(),
                  userRepository: context.read<UserRepository>())
                ..add(DeepLinkSetup()),
            ),
            BlocProvider<VersionBloc>(
                create: (context) => VersionBloc(
                    versionRepository: context.read<VersionRepository>(),
                    versionUtil: VersionUtil())),
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (BuildContext context, ThemeState state) => App(
                    themeData: state.themeData,
                    storageRepository: storageRepository,
                    imageRepository: imageRepository,
                  )),
        ),
      ),
    );
  }, (Object error, StackTrace stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
  });
}

Future<User> _getLoggedUser(AuthRepository authRepository) {
  return authRepository.getAuthState().first;
}

Future _precacheAssets() async {
  await precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoder,
        'assets/icons/white-belt.svg',
      ),
      null);
  await precachePicture(
    ExactAssetPicture(
      SvgPicture.svgStringDecoder,
      'assets/icons/blue-belt.svg',
    ),
    null,
  );
  await precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoder,
        'assets/icons/purple-belt.svg',
      ),
      null);
  await precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoder,
        'assets/icons/brown-belt.svg',
      ),
      null);
  await precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoder,
        'assets/icons/black-belt.svg',
      ),
      null);
}
