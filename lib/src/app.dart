import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/resources/auth_repository.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:checkin/src/routes/application.dart';
import 'package:checkin/src/ui/pages/home_page.dart';
import 'package:checkin/src/ui/pages/login_page.dart';
import 'package:checkin/src/ui/pages/splash_page.dart';
import 'package:checkin/src/ui/pages/stats_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';

import 'blocs/user/bloc.dart';

class App extends StatelessWidget {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  App({
    Key key,
    @required AuthRepository authRepository,
    @required UserRepository userRepository,
  })  : assert(authRepository != null && userRepository != null),
        _authRepository = authRepository,
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        // todo can this be removed?
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
      ],
      onGenerateRoute: Application.router.generator,
      initialRoute: '/',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primaryColor: Color(0xFF242966),
        accentColor: Color(0xFF1B3FE3),
        buttonTheme: ButtonThemeData(
            buttonColor: Color(0xFF5770FF),
            disabledColor: Color(0xFFBBBBBB),
            height: 48,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(4.0))),
        textTheme: TextTheme(
          headline: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: 0.25,
          ),
          title: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            letterSpacing: 0.25,
          ),
          subtitle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
            letterSpacing: 0.25,
          ),
          body1: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
            letterSpacing: 0.25,
          ),
          display1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Color(0xFF2F54FC),
            letterSpacing: 0.4,
          ),
          button: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 1.25,
          ),
        ),
      ),
      home: I18n(
        child: BlocBuilder<AuthBloc, AuthState>(
            builder: (BuildContext context, AuthState state) {
          if (state is AuthUnauthenticated) {
            return LoginPage(
                authRepository: _authRepository, userRepository: _userRepository);
          }

          if (state is AuthAuthenticated) {
            debugPrint("User Authenticated: [${state.loggedUserEmail}]");
            return BlocProvider<UserBloc>(
              create: (BuildContext context) => UserBloc(
                userRepository: _userRepository,
                authBloc: BlocProvider.of<AuthBloc>(context),
              ),
              child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    bottomNavigationBar: Material(
                      color: Colors.black87,
                      child: TabBar(
                        tabs: <Widget>[
                          Tab(icon: Icon(Icons.home)),
                          Tab(icon: Icon(Icons.insert_chart)),
                        ],
                      ),
                    ),
                    body: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        HomePage(),
                        StatsPage(),
                      ],
                    ),
                  )),
            );
          }

          return SplashPage();
        }),
      ),
    );
  }
}
