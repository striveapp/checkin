import 'package:bloc/bloc.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/dynamic_link_repository.dart';
import 'package:checkin/src/repositories/local_storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/resources/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import 'dynamic_link_event.dart';
import 'dynamic_link_state.dart';

class DynamicLinkBloc extends Bloc<DynamicLinkEvent, DynamicLinkState> {
  static const emailMissingError =
      'Make sure to open magic link on the same device used to send it';
  static const invalidActionError =
      'Magic link is expired or has already been used';

  final FirebaseDynamicLinks dynamicLinks;
  final LocalStorageRepository localStorageRepository;
  final DynamicLinkRepository dynamicLinkRepository;
  final AuthRepository authRepository;
  final AnalyticsRepository analyticsRepository;
  final UserRepository userRepository;

  DynamicLinkBloc(
      {@required FirebaseDynamicLinks this.dynamicLinks,
      @required LocalStorageRepository this.localStorageRepository,
      @required AuthRepository this.authRepository,
      @required DynamicLinkRepository this.dynamicLinkRepository,
      @required AnalyticsRepository this.analyticsRepository,
      @required UserRepository this.userRepository})
      : super(DynamicLinkInitial());

  @override
  Stream<DynamicLinkState> mapEventToState(DynamicLinkEvent event) async* {
    if (event is DeepLinkSetup) {
      final PendingDynamicLinkData data = await dynamicLinks.getInitialLink();

      onSuccessLink(data);

      dynamicLinks.onLink(
        onSuccess: onSuccessLink,
        onError: onErrorLink,
      );
    }

    if (event is DeepLinkReceived) {
      String path = event.deepLink.path;

      if (path.startsWith("/register/")) {
        yield* _handleRegister(path);
      } else if (path.startsWith("/__/auth/")) {
        yield* _handleEmailAuthLink(event);
      } else {
        yield* _handleNavigationLink(event, path);
      }
    }

    if (event is DeepLinkErrorEvent) {
      yield DynamicLinkError(errorMessage: event.error.toString());
    }

    if (event is ShareRegistryLink) {
      var registryLink = await dynamicLinkRepository.getRegistryLink(
          event.date, event.lessonId);
      yield DynamicLinkToShare(link: registryLink);
    }
  }

  Stream<DynamicLinkState> _handleEmailAuthLink(DeepLinkReceived event) async* {
    var userEmail = await localStorageRepository.getUserEmail();

    try {
      var loggedUser = await authRepository.completeSignInPasswordless(
          userEmail, event.deepLink);
      await analyticsRepository.setUserProperties(loggedUser.uid);
      await analyticsRepository.logLoginWithPasswordlessSignIn();
      await userRepository.createUser(
        loggedUser,
      );
      yield DynamicLinkAuthenticated();
    } on UserAlreadyLoggedInException catch (_) {
      await analyticsRepository
          .logAuthLinkOpenWithUserAlreadyLoggedIn(userEmail);
      // todo we should not expose firebase classes in bloc (FirebaseAuthException)
    } on FirebaseAuthException catch (err, stackTrace) {
      String errorMessage = err.toString();
      // The out of band code is invalid. This can happen if the code is malformed, expired, or has already been used.
      if (err.code == 'invalid-action-code') {
        errorMessage = invalidActionError;
      }

      yield* _handlePasswordlessError(errorMessage, stackTrace);
    } catch (err, stackTrace) {
      String errorMessage = err.toString();
      if (userEmail == null) {
        errorMessage = emailMissingError;
      }

      yield* _handlePasswordlessError(errorMessage, stackTrace);
    }
  }

  Stream<DynamicLinkState> _handlePasswordlessError(
      String errorMessage, StackTrace stackTrace) async* {
    await analyticsRepository.passwordlessError(
        err: errorMessage, stackTrace: stackTrace);
    yield DynamicLinkError(errorMessage: errorMessage);
  }

  Stream<DynamicLinkState> _handleRegister(String path) async* {
    final referredGymId = path.replaceAll("/register/", "");
    await localStorageRepository.setReferredGymId(referredGymId);
  }

  Stream<DynamicLinkState> _handleNavigationLink(
      DeepLinkReceived event, String path) async* {
    if (event.deepLink.hasQuery) {
      path = "$path?${event.deepLink.query}";
    }

    yield DynamicLinkToNavigate(path: path);
  }

  Future<dynamic> onSuccessLink(PendingDynamicLinkData dynamicLink) async {
    final Uri deepLink = dynamicLink?.link;

    if (deepLink != null) {
      add(DeepLinkReceived(deepLink: deepLink));
    }
  }

  Future<dynamic> onErrorLink(OnLinkErrorException e) async {
    add(DeepLinkErrorEvent(error: e));
  }
}
