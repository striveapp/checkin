import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/dynamic_link/bloc.dart';
import 'package:checkin/src/blocs/theme/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/routes/application.dart';
import 'package:checkin/src/themes/theme.dart';
import 'package:checkin/src/ui/components/upgrader_dialog.dart';
import 'package:checkin/src/ui/pages/home_page.dart';
import 'package:checkin/src/ui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:share/share.dart';

import 'blocs/gym/bloc.dart';
import 'blocs/user/bloc.dart';
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
      themeBloc.add(UpdateTheme(themeType: ThemeType.NewLight));
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
                      backgroundColor: Theme.of(context).accentColor.withAlpha(150),
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
          ],
          child: BlocBuilder<AuthBloc, AuthState>(builder: (BuildContext context, AuthState state) {
            Logger.log.i("Auth state change detected [$state]");
            if (state is AuthAuthenticated) {
              Logger.log.i("User authenticated: [${state.loggedUser}]");
              return MultiBlocProvider(
                providers: [
                  BlocProvider<UserBloc>(
                      create: (BuildContext context) => UserBloc(
                            userRepository: context.read<UserRepository>(),
                            storageRepository: context.read<StorageRepository>(),
                            imageRepository: context.read<ImageRepository>(),
                            authBloc: context.read<AuthBloc>(),
                          )),
                  BlocProvider<GymBloc>(
                    create: (BuildContext context) => GymBloc(
                      gymRepository: context.read<GymRepository>(),
                      userRepository: context.read(),
                    )..add(InitializeGym()),
                  ),
                ],
                child: HomePage(),
              );
            }

            //NOTE: state is AuthUnauthenticated
            return LoginPage();
          }),
        ),
      ),
    );
  }
}
