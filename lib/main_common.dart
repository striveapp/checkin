import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/app_config.dart';
import 'package:checkin/src/api/lesson_api.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/dynamic_link/bloc.dart';
import 'package:checkin/src/blocs/notification/notification_bloc.dart';
import 'package:checkin/src/blocs/notification/notification_event.dart';
import 'package:checkin/src/blocs/theme/bloc.dart';
import 'package:checkin/src/blocs/version/bloc.dart';
import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/dynamic_link_repository.dart';
import 'package:checkin/src/repositories/graduation_system_repository.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/lesson_config_repository.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/repositories/lesson_template_repository.dart';
import 'package:checkin/src/repositories/local_storage_repository.dart';
import 'package:checkin/src/repositories/membership_repository.dart';
import 'package:checkin/src/repositories/notification_repository.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/repositories/version_repository.dart';
import 'package:checkin/src/resources/analytics_provider.dart';
import 'package:checkin/src/resources/auth_provider.dart';
import 'package:checkin/src/resources/dynamic_link_provider.dart';
import 'package:checkin/src/resources/graduation_system_provider.dart';
import 'package:checkin/src/resources/gym_provider.dart';
import 'package:checkin/src/resources/image_provider.dart';
import 'package:checkin/src/resources/lesson_config_provider.dart';
import 'package:checkin/src/resources/lesson_instances_provider.dart';
import 'package:checkin/src/resources/lesson_template_provider.dart';
import 'package:checkin/src/resources/local_storage_provider.dart';
import 'package:checkin/src/resources/membership_provider.dart';
import 'package:checkin/src/resources/notification_provider.dart';
import 'package:checkin/src/resources/stats_provider.dart';
import 'package:checkin/src/resources/storage_provider.dart';
import 'package:checkin/src/resources/user_provider.dart';
import 'package:checkin/src/routes/application.dart';
import 'package:checkin/src/routes/routes.dart';
import 'package:checkin/src/simple_bloc_observer.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:checkin/src/util/version_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart' hide ImageProvider;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/src/repository_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:platform/platform.dart';

import 'src/app.dart';
import 'src/blocs/dynamic_link/dynamic_link_event.dart';

Future<void> mainCommon(AppConfig appConfig) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  if (appConfig.useEmulator) {
    //TODO: This works in the emulator but not in the physical device
    FirebaseFirestore.instance.settings = Settings(
      host: LocalPlatform().isAndroid ? '192.168.1.95:8080' : 'localhost:8080',
      sslEnabled: false,
    );
  }
  // init bloc delegate
  Bloc.observer = SimpleBlocObserver();

  // setup crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  // init routes
  Routes.configureRoutes(Application.router);

  // init logger
  Logger.log = appConfig.logger;

  final AuthProvider authProvider = AuthProvider(appConfig: appConfig);
  final user = await _getLoggedUser(authProvider);

  await _precacheAssets();

  runZonedGuarded<Future<void>>(() async {
    runApp(
      MultiRepositoryProvider(
        providers: _repositories(authProvider, appConfig),
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
                gymRepository: context.read(),
                localStorageRepository: context.read<LocalStorageRepository>(),
                loggedUser: user,
                // todo retrieve from storage cache
                versionUtil: VersionUtil(),
              )..add(AppStarted()),
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
                      versionUtil: VersionUtil(),
                    )),
            BlocProvider<NotificationBloc>(
                create: (context) => NotificationBloc(
                      notificationRepository: context.read(),
                      userRepository: context.read(),
                    )..add(InitializeNotifications())),
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (BuildContext context, ThemeState state) => App(
                    themeData: state.themeData,
                  )),
        ),
      ),
    );
  }, (Object error, StackTrace stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
  });
}

List<RepositoryProviderSingleChildWidget> _repositories(
        AuthProvider authProvider, AppConfig appConfig) =>
    [
      RepositoryProvider<LessonRepository>(
        create: (context) => LessonInstancesProvider(dateUtil: DateUtil()),
      ),
      RepositoryProvider<LessonTemplateRepository>(
        create: (context) => LessonTemplateProvider(),
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
        create: (context) => StatsProvider(dateUtil: DateUtil()),
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
      ),
      RepositoryProvider<GymRepository>(
        create: (context) => GymProvider(),
      ),
      RepositoryProvider<ImageRepository>(
        create: (context) => ImageProvider(),
      ),
      RepositoryProvider<StorageRepository>(
        create: (context) => StorageProvider(),
      ),
      RepositoryProvider<DateUtil>(
        create: (context) => DateUtil(),
      ),
      RepositoryProvider<NotificationRepository>(
        create: (context) => NotificationProvider(),
      ),
    ];

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
