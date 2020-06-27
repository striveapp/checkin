import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/dynamic_link/bloc.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/routes/application.dart';
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

import 'blocs/user/bloc.dart';
import 'blocs/version/bloc.dart';

class App extends StatelessWidget {
  final ThemeData _themeData;
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  final StorageRepository _storageRepository;
  final ImageRepository _imageRepository;
  final AnalyticsRepository _analyticsRepository;

  App({
    Key key,
    @required ThemeData themeData,
    @required AuthRepository authRepository,
    @required UserRepository userRepository,
    @required StorageRepository storageRepository,
    @required ImageRepository imageRepository,
    @required AnalyticsRepository analyticsRepository,
  })  : assert(themeData != null &&
            authRepository != null &&
            userRepository != null &&
            storageRepository != null &&
            imageRepository != null &&
            analyticsRepository != null),
        _themeData = themeData,
        _authRepository = authRepository,
        _userRepository = userRepository,
        _storageRepository = storageRepository,
        _imageRepository = imageRepository,
        _analyticsRepository = analyticsRepository,
        super(key: key);

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
      ],
      onGenerateRoute: Application.router.generator,
      initialRoute: '/',
      navigatorObservers: [
        _analyticsRepository.getNavigationObserver(),
      ],
      theme: _themeData,
      home: I18n(
//        note: enable es locale
//        initialLocale: Locale("es", "ES"),
        child: MultiBlocListener(
          listeners: [
            BlocListener<DynamicLinkBloc, DynamicLinkState>(
                listener: (BuildContext context, DynamicLinkState state) {
              if (state is DynamicLinkToNavigate) {
                debugPrint("deep link received with path ${state.path}");
                Navigator.of(context).pushNamed(state.path);
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
              return LoginPage(
                authRepository: _authRepository,
                userRepository: _userRepository,
                analyticsRepository: _analyticsRepository,
              );
            }

            if (state is AuthAuthenticated) {
              debugPrint("User Authenticated: [${state.loggedUser}]");
              return MultiBlocProvider(
                providers: [
                  BlocProvider<UserBloc>(
                      create: (BuildContext context) => UserBloc(
                            userRepository: _userRepository,
                            storageRepository: _storageRepository,
                            imageRepository: _imageRepository,
                            authBloc: BlocProvider.of<AuthBloc>(context),
                          )),
                ],
                child: DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      bottomNavigationBar: Material(
                        color: Colors.black87,
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
