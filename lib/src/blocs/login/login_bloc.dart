import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/login/login_event.dart';
import 'package:checkin/src/blocs/login/login_state.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  final AnalyticsRepository _analyticsRepository;
  static const loginError = 'Login failed';

  LoginBloc({
    @required AuthRepository authRepository,
    @required UserRepository userRepository,
    @required AnalyticsRepository analyticsRepository,
  })  : assert(authRepository != null &&
            userRepository != null &&
            authRepository != null),
        _authRepository = authRepository,
        _userRepository = userRepository,
        _analyticsRepository = analyticsRepository;

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithGoogle) {
      try {
        final loggedUser = await _authRepository.signInWithGoogle();
        if (loggedUser != null) {
          await _analyticsRepository.setUserProperties(loggedUser.uid);
          await _analyticsRepository.logLoginWithGoogleSignIn();
          await _userRepository.createUser(loggedUser);
          yield LoginSuccess(loggedUser: loggedUser);
        } else {
          debugPrint("Unable to login, loggedUser: $loggedUser");
          yield LoginFailure(errorMessage: loginError);
        }
      } catch (e) {
        debugPrint("Unexpected error, login failed [$e]");
        yield LoginFailure(errorMessage: "Unexpected error! [$e]");
      }
    }

    //TODO: We put this because we have no way to test google auth for now. https://trello.com/c/I4PenA6Y
    if (event is LoginWithTestUser) {
      yield LoginLoading();
      final testUser1 = await _authRepository.loginWithTestUser(test: 1);
      debugPrint('Logged with test user [$testUser1]');
      yield LoginSuccess(loggedUser: testUser1);
    }

    if (event is LoginWithTestUserTwo) {
      yield LoginLoading();
      final testUser2 = await _authRepository.loginWithTestUser(test: 2);
      debugPrint('Logged with test user [$testUser2]');
      yield LoginSuccess(loggedUser: testUser2);
    }

    if (event is LoginWithTestUserOwner) {
      yield LoginLoading();
      final testOwner = await _authRepository.loginWithTestUser(owner: true);
      debugPrint('Logged with test user [$testOwner]');
      yield LoginSuccess(loggedUser: testOwner);
    }
  }
}
