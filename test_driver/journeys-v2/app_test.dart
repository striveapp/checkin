import 'package:checkin/app_config.dart';
import 'package:checkin/src/api/lesson_api.dart';
import 'package:checkin/src/app.dart';
import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/auth/auth_event.dart';
import 'package:checkin/src/blocs/dynamic_link/bloc.dart';
import 'package:checkin/src/blocs/theme/bloc.dart';
import 'package:checkin/src/blocs/version/bloc.dart';
import 'package:checkin/src/logging/dev_logger.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/dynamic_link_repository.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/lesson_config_repository.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/repositories/local_storage_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/repositories/version_repository.dart';
import 'package:checkin/src/resources/analytics_provider.dart';
import 'package:checkin/src/resources/auth_provider.dart';
import 'package:checkin/src/resources/dynamic_link_provider.dart';
import 'package:checkin/src/resources/gym_provider.dart';
import 'package:checkin/src/resources/image_provider.dart';
import 'package:checkin/src/resources/lesson_config_provider.dart';
import 'package:checkin/src/resources/lesson_instances_provider.dart';
import 'package:checkin/src/resources/local_storage_provider.dart';
import 'package:checkin/src/resources/storage_provider.dart';
import 'package:checkin/src/resources/user_provider.dart';
import 'package:checkin/src/ui/components/lessons/lesson_card.dart';
import 'package:checkin/src/util/version_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart' hide ImageProvider;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../util.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Do some shit", (WidgetTester tester) async {
    await Firebase.initializeApp();
    var appConfig = AppConfig(
      flavor: 'dev',
      appUniqueIdentifier: 'com.arya.checkin.dev',
      dynamicLinkDomain: 'arya.page.link',
      deepLinkUrl: 'https://checkin-test-fba3d.web.app',
      logger: DevLogger.logger,
    );
    await tester.pumpWidget(MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LessonRepository>(
          create: (context) => LessonInstancesProvider(),
        ),
        RepositoryProvider<AuthRepository>(
          create: (context) {
            return AuthProvider(appConfig: appConfig);
          },
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
        RepositoryProvider<VersionRepository>(
          create: (context) => VersionRepository(),
        ),
        RepositoryProvider<LessonConfigRepository>(
          create: (context) => LessonConfigProvider(),
        ),
        RepositoryProvider<GymRepository>(
          create: (context) => GymProvider(),
        ),
        RepositoryProvider<LocalStorageRepository>(
          create: (context) => LocalStorageProvider(),
        ),
        RepositoryProvider<StorageRepository>(
          create: (context) => StorageProvider(),
        ),
        RepositoryProvider<ImageRepository>(
          create: (context) => ImageProvider(),
        ),
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
              gymRepository: context.read(),
              localStorageRepository: context.read<LocalStorageRepository>(),
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
                  versionUtil: VersionUtil())),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (BuildContext context, ThemeState state) => App(
                  themeData: state.themeData,
                )),
      ),
    ));

    prettyPrint("Logged as USER test@test.com");
    await tester.tap(find.byKey(Key('backdoorButton')));
    await tester.pumpAndSettle(Duration(seconds: 2));

    expect(find.byType(LessonCard), findsWidgets);
  });
}
