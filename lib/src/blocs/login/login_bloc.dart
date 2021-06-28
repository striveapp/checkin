// @dart=2.9

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/login/login_event.dart';
import 'package:checkin/src/blocs/login/login_state.dart';
import 'package:checkin/src/logging/logger.dart';
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
          if (await userRepository.isFirstLogin(loggedUser.email)) {
            Logger.log.i("Creating new user with email: ${loggedUser.email}");
            await userRepository.createUser(
              loggedUser,
            );
          }
        } else {
          Logger.log.w("Unable to login using [$event]");
          yield LoginFailure(errorMessage: loginError);
        }
      } catch (e, st) {
        Logger.log.e("Unexpected error! Login failed for ${event}", e, st);
        await analyticsRepository.loginError(
          err: e,
          stackTrace: st,
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
          if (await userRepository.isFirstLogin(loggedUser.email)) {
            Logger.log.i("Creating new user with email: ${loggedUser.email}");
            await userRepository.createUser(
              loggedUser,
            );
          }
        } else {
          Logger.log.w("Unable to login using [$event]");
          yield LoginFailure(errorMessage: loginError);
        }
      } on AppleSignInNotSupportedException catch (err) {
        await analyticsRepository.loginError(
          err: err,
        );
        yield LoginFailure(errorMessage: err.toString());
      } catch (e, st) {
        Logger.log.e("Unexpected error! Login failed for ${event}", e, st);
        await analyticsRepository.loginError(
          err: e,
          stackTrace: st,
        );
        yield LoginFailure(
          errorMessage: "Unexpected error! Please contact the gym owner",
        );
      }
    }

    if (event is LoginPasswordless) {
      await localStorageRepository.setUserEmail(event.userEmail);
      try {
        await authRepository.signInPasswordless(event.userEmail);
      } catch (err, stackTrace) {
        await analyticsRepository.passwordlessError(
          err: err,
          stackTrace: stackTrace,
        );
        //TODO: we are doing this in order to avoid bloc to cache our state in case the user triggers again the error
        yield LoginInitial();
        yield WrongfullyInsertedEmail();
      }
    }

    if (event is LoginWithTestUser) {
      final testUser1 = await authRepository.loginWithTestUser(test: 1);
      Logger.log.i('Logged with test user [$testUser1]');
    }

    if (event is LoginWithTestUserTwo) {
      final testUser2 = await authRepository.loginWithTestUser(test: 2);
      Logger.log.i('Logged with test user [$testUser2]');
    }

    if (event is LoginWithTestUserAdmin) {
      final testOwner = await authRepository.loginWithTestUser(owner: true);
      Logger.log.i('Logged with test user [$testOwner]');
    }

    if (event is LoginWithTestUserMaster) {
      final testMaster = await authRepository.loginWithTestUser(master: true);
      Logger.log.i('Logged with test user [$testMaster]');
    }
  }
}
