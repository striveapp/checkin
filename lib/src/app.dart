// @dart=2.9

import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/dynamic_link/bloc.dart';
import 'package:checkin/src/blocs/notification/notification_bloc.dart';
import 'package:checkin/src/blocs/notification/notification_event.dart';
import 'package:checkin/src/blocs/notification/notification_state.dart';
import 'package:checkin/src/blocs/onboarding/onboarding_bloc.dart';
import 'package:checkin/src/blocs/onboarding/onboarding_state.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/blocs/theme/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/routes/application.dart';
import 'package:checkin/src/themes/theme.dart';
import 'package:checkin/src/ui/components/notification_snack_bar_content.dart';
import 'package:checkin/src/ui/components/upgrader_dialog.dart';
import 'package:checkin/src/ui/pages/home_page.dart';
import 'package:checkin/src/ui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:share/share.dart';

import 'blocs/version/bloc.dart';

class App extends StatefulWidget {
  final ThemeData _themeData;

  App({
    Key key,
    @required ThemeData themeData,
  })  : assert(themeData != null),
        _themeData = themeData,
        super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    _onPlatformBrightnessChanged();

    var instance = WidgetsBinding.instance;
    instance.addObserver(this);
    instance.window.onPlatformBrightnessChanged = _onPlatformBrightnessChanged;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(final AppLifecycleState state) {
    Logger.log.i("AppLifecycleState changed to [$state]");
    if (state == AppLifecycleState.resumed) {
      var authBloc = context.read<AuthBloc>();
      authBloc.add(AppStarted());
    }
  }

  void _onPlatformBrightnessChanged() {
    final platformBrightness = WidgetsBinding.instance.window.platformBrightness;
    var themeBloc = context.read<ThemeBloc>();

    if (platformBrightness == Brightness.dark) {
      themeBloc.add(UpdateTheme(themeType: ThemeType.Dark));
    } else {
      themeBloc.add(UpdateTheme(themeType: ThemeType.Light));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
        const Locale('it', ''),
      ],
      onGenerateRoute: Application.router.generator,
      initialRoute: '/',
      navigatorObservers: [
        RepositoryProvider.of<AnalyticsRepository>(context).getNavigationObserver(),
      ],
      theme: widget._themeData,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child,
      ),
      home: I18n(
        // NOTE: enable locale
        // initialLocale: Locale("it", "IT"),
        child: MultiBlocListener(
          listeners: [
            BlocListener<DynamicLinkBloc, DynamicLinkState>(
                listener: (BuildContext context, DynamicLinkState state) {
              if (state is DynamicLinkToNavigate) {
                Logger.log.i("Deep link received! Path to navigate [${state.path}]");
                Navigator.of(context).popUntil(ModalRoute.withName(Navigator.defaultRouteName));

                Navigator.of(context).pushNamed(state.path);
              }

              if (state is DynamicLinkAuthenticated) {
                // must reload authbloc listener, when app is open in the same task stack of another app
                var authBloc = context.read<AuthBloc>();
                authBloc.add(AppStarted());
              }

              if (state is DynamicLinkToShare) {
                Share.share(state.link);
              }

              if (state is DynamicLinkError) {
                // todo refactor this logic is used in multiple places
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(
                        state.errorMessage.i18n,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      backgroundColor: Theme.of(context).colorScheme.secondary.withAlpha(150),
                      duration: Duration(seconds: 10),
                    ),
                  );
              }
            }),
            BlocListener<VersionBloc, VersionState>(
                listener: (BuildContext context, VersionState state) {
              if (state is UpdateRequired) {
                UpgraderDialog.show(context);
              }
            }),
            BlocListener<NotificationBloc, NotificationState>(
                listener: (BuildContext context, NotificationState state) {
              if (state is NotificationToNavigate) {
                Logger.log.i("Notification opened! Path to navigate [${state.path}]");
                Navigator.of(context).popUntil(ModalRoute.withName(Navigator.defaultRouteName));
                Navigator.of(context).pushNamed(state.path);
              }

              if (state is ShowSnackBar) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                    content: NotificationSnackBarContent(
                      title: state.title.i18n.fill(state.titleLocArgs),
                      body: state.body.i18n.fill(state.bodyLocArgs),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.background.withAlpha(200),
                    duration: Duration(milliseconds: 2500),
                  ));
              }
            }),
            BlocListener<OnboardingBloc, OnboardingState>(
                listener: (BuildContext context, OnboardingState state) {
              if (state is ShowDialog) {
                Logger.log.i("Show demo dialog...");
                // ...showTheDialog..
              }
            }),
          ],
          child: BlocBuilder<AuthBloc, AuthState>(builder: (BuildContext context, AuthState state) {
            Logger.log.i("Auth state change detected [$state]");
            if (state is AuthAuthenticated) {
              Logger.log.i("User authenticated: [${state.loggedUser}]");
              context
                  .read<NotificationBloc>()
                  .add(UpdateToken(loggedUserEmail: state.loggedUser.email));
              return BlocProvider<ProfileBloc>(
                  create: (BuildContext context) => ProfileBloc(
                        userRepository: context.read(),
                        imageRepository: context.read(),
                        storageRepository: context.read(),
                      )..add(InitializeProfile()),
                  child: HomePage());
            }

            //NOTE: state is AuthUnauthenticated
            return LoginPage();
          }),
        ),
      ),
    );
  }
}
