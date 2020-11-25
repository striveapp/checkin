import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/dynamic_link/bloc.dart';
import 'package:checkin/src/blocs/theme/bloc.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/routes/application.dart';
import 'package:checkin/src/themes/theme.dart';
import 'package:checkin/src/ui/components/upgrader_dialog.dart';
import 'package:checkin/src/ui/pages/home_page.dart';
import 'package:checkin/src/ui/pages/leaderboard_page.dart';
import 'package:checkin/src/ui/pages/login_page.dart';
import 'package:checkin/src/ui/pages/splash_page.dart';
import 'package:checkin/src/ui/pages/stats_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:share/share.dart';

import 'blocs/user/bloc.dart';
import 'blocs/version/bloc.dart';

class App extends StatefulWidget {
  final ThemeData _themeData;
  final StorageRepository _storageRepository;
  final ImageRepository _imageRepository;

  App({
    Key key,
    @required ThemeData themeData,
    @required StorageRepository storageRepository,
    @required ImageRepository imageRepository,
  })  : assert(themeData != null &&
            storageRepository != null &&
            imageRepository != null),
        _themeData = themeData,
        _storageRepository = storageRepository,
        _imageRepository = imageRepository,
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
    if (state == AppLifecycleState.resumed) {
      var authBloc = context.read<AuthBloc>();
      authBloc.add(AppStarted());
    }
  }

  void _onPlatformBrightnessChanged() {
    final platformBrightness = WidgetsBinding.instance.window.platformBrightness;
    var themeBloc = context.read<ThemeBloc>();

    if (platformBrightness == Brightness.dark) {
      themeBloc.add(ThemeUpdated(themeType: ThemeType.Dark));
    } else {
      themeBloc.add(ThemeUpdated(themeType: ThemeType.NewLight));
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
        RepositoryProvider.of<AnalyticsRepository>(context)
            .getNavigationObserver(),
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
                debugPrint("deep link received with path ${state.path}");
                Navigator.of(context)
                    .popUntil(ModalRoute.withName(Navigator.defaultRouteName));

                Navigator.of(context).pushNamed(state.path);
              }

              if(state is DynamicLinkToShare) {
                Share.share(state.link);
              }
            }),
            BlocListener<VersionBloc, VersionState>(
                listener: (BuildContext context, VersionState state) {
              if (state is UpdateRequired) {
                UpgraderDialog.show(context);
              }
            }),
          ],
          child: BlocBuilder<AuthBloc, AuthState>(
              builder: (BuildContext context, AuthState state) {
            debugPrint("auth state change detected in main app [$state]");

            if (state is AuthUnauthenticated) {
              return LoginPage();
            }

            if (state is AuthAuthenticated) {
              debugPrint("User Authenticated: [${state.loggedUser}]");
              return MultiBlocProvider(
                providers: [
                  BlocProvider<UserBloc>(
                      create: (BuildContext context) => UserBloc(
                            userRepository:
                                RepositoryProvider.of<UserRepository>(context),
                            storageRepository: widget._storageRepository,
                            imageRepository: widget._imageRepository,
                            authBloc: BlocProvider.of<AuthBloc>(context),
                          )),
                ],
                child: DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      bottomNavigationBar: Material(
                        color: Colors.black87,
                        child: SafeArea(
                          child: TabBar(
                            tabs: <Widget>[
                              Tab(icon: Icon(Icons.home)),
                              Tab(
                                  key: Key("statsTab"),
                                  icon: Icon(Icons.insert_chart)),
                              Tab(
                                  key: Key("leaderboardTab"),
                                  icon: Icon(Icons.star)),
                            ],
                          ),
                        ),
                      ),
                      body: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          HomePage(),
                          StatsPage(
                            userEmail: state.loggedUser.email,
                          ),
                          LeaderboardPage(),
                        ],
                      ),
                    )),
              );
            }

            return SplashPage();
          }),
        ),
      ),
    );
  }
}
