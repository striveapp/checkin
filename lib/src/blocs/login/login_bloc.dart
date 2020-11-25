import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/login/login_event.dart';
import 'package:checkin/src/blocs/login/login_state.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/local_storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/resources/auth_provider.dart' hide AuthProvider;
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  final AnalyticsRepository analyticsRepository;
  final LocalStorageRepository localStorageRepository;
  static const loginError = 'Login failed';

  LoginBloc({
    @required AuthRepository this.authRepository,
    @required UserRepository this.userRepository,
    @required AnalyticsRepository this.analyticsRepository,
    @required LocalStorageRepository this.localStorageRepository,
  }) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithGoogle) {
      try {
        final loggedUser = await authRepository.signInWithGoogle();
        if (loggedUser != null) {
          await analyticsRepository.setUserProperties(loggedUser.uid);
          await analyticsRepository.logLoginWithGoogleSignIn();
          await userRepository.createUser(
            loggedUser,
          );
          yield LoginSuccess(loggedUser: loggedUser);
        } else {
          debugPrint("Unable to login, loggedUser: $loggedUser");
          yield LoginFailure(errorMessage: loginError);
        }
      } catch (err, stackTrace) {
        debugPrint("Unexpected error, login failed [$err]");
        await analyticsRepository.loginError(
          err: err,
          stackTrace: stackTrace,
        );
        yield LoginFailure(errorMessage: "Unexpected error! Please contact the gym owner");
      }
    }

    if (event is LoginWithApple) {
      try {
        final loggedUser = await authRepository.signInWithApple();
        if (loggedUser != null) {
          await analyticsRepository.setUserProperties(loggedUser.uid);
          await analyticsRepository.logLoginWithAppleSignIn();
          await userRepository.createUser(
            loggedUser,
          );
          yield LoginSuccess(loggedUser: loggedUser);
        } else {
          debugPrint("Unable to login, loggedUser: $loggedUser");
          yield LoginFailure(errorMessage: loginError);
        }
      } on AppleSignInNotSupportedException catch (err) {
        await analyticsRepository.loginError(
          err: err,
        );
        yield LoginFailure(errorMessage: err.toString());
      } catch (err, stackTrace) {
        debugPrint("Unexpected error, login failed [$err]");
        await analyticsRepository.loginError(
          err: err,
          stackTrace: stackTrace,
        );
        yield LoginFailure(errorMessage: "Unexpected error! Please contact the gym owner");
      }
    }

    if (event is LoginPasswordless) {
      await localStorageRepository.setUserEmail(event.userEmail);
      await authRepository.signInPasswordless(event.userEmail);
      yield LoginWaitingForEmailLink(userEmail: event.userEmail);
    }

    //TODO: We put this because we have no way to test google auth for now. https://trello.com/c/I4PenA6Y
    if (event is LoginWithTestUser) {
      yield LoginLoading();
      final testUser1 = await authRepository.loginWithTestUser(test: 1);
      debugPrint('Logged with test user [$testUser1]');
      yield LoginSuccess(loggedUser: testUser1);
    }

    if (event is LoginWithTestUserTwo) {
      yield LoginLoading();
      final testUser2 = await authRepository.loginWithTestUser(test: 2);
      debugPrint('Logged with test user [$testUser2]');
      yield LoginSuccess(loggedUser: testUser2);
    }

    if (event is LoginWithTestUserAdmin) {
      yield LoginLoading();
      final testOwner = await authRepository.loginWithTestUser(owner: true);
      debugPrint('Logged with test user [$testOwner]');
      yield LoginSuccess(loggedUser: testOwner);
    }

    if (event is LoginWithTestUserMaster) {
      yield LoginLoading();
      final testOwner = await authRepository.loginWithTestUser(master: true);
      debugPrint('Logged with test user [$testOwner]');
      yield LoginSuccess(loggedUser: testOwner);
    }
  }
}
