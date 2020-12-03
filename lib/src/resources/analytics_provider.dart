import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/util/crypto_util.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/src/widgets/pages.dart';
import 'package:flutter/src/widgets/routes.dart';
import 'package:platform/platform.dart';

class AnalyticsProvider implements AnalyticsRepository {
  final FirebaseAnalytics _firebaseAnalytics = FirebaseAnalytics();
  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  @override
  RouteObserver<PageRoute> getNavigationObserver() =>
      FirebaseAnalyticsObserver(analytics: _firebaseAnalytics);

  @override
  Future<void> setUserProperties(String uid) async => await _firebaseAnalytics.setUserId(uid);

  Future<void> logLoginWithGoogleSignIn() async =>
      await _firebaseAnalytics.logLogin(loginMethod: "google_sign_in");

  @override
  Future<void> logLoginWithAppleSignIn() async {
    await _firebaseAnalytics.logLogin(loginMethod: "apple_sign_in");
  }

  @override
  Future<void> logUnsubscribe() async {
    await _firebaseAnalytics.logEvent(name: "unsubscribe");
  }

  @override
  Future<void> logUserLocale() async {
    await _firebaseAnalytics.logEvent(name: "user_locale", parameters: {
      "locale": LocalPlatform().localeName,
    });
  }

  @override
  Future<void> logAuthLinkOpenWithUserAlreadyLoggedIn(String userEmail) async {
    await _firebaseAnalytics
        .logEvent(name: "auth_link_open_with_user_already_logged", parameters: {
      "userEmail": '$userEmail',
    });
  }

  Future<void> loginError({dynamic err, StackTrace stackTrace}) async {
    String message = err.toString();

    await _crashlytics.recordError(err, stackTrace, reason: "login error");
    await _firebaseAnalytics.logEvent(name: "login_error", parameters: {
      "hash": CryptoUtil.generateMd5(message),
      "message": message.length > 100 ? message.substring(0, 100) : message,
    });
  }

  Future<void> setupBankAccountError({String error}) async {
    await _crashlytics.recordError(error, null, reason: "setup bank account error");
    await _firebaseAnalytics.logEvent(name: "setup_bank_account_error", parameters: {
      "hash": CryptoUtil.generateMd5(error),
      "message": error.length > 100 ? error.substring(0, 100) : error,
    });
  }

  Future<void> logSubscriptionWithEmptyCustomer({String gymId, String priceId}) async =>
      await _firebaseAnalytics.logEvent(name: "subscription_with_empty_customer", parameters: {
        "gymId": gymId,
        "priceId": priceId,
      });

  Future<void> subscriptionError({dynamic err, StackTrace stackTrace}) async {
    String message = err.toString();

    await _crashlytics.recordError(err, stackTrace, reason: "subscription error");
    await _firebaseAnalytics.logEvent(name: "subscription_error", parameters: {
      "hash": CryptoUtil.generateMd5(message),
      "message": message.length > 100 ? message.substring(0, 100) : message,
    });
  }

  Future<void> unsubscribeError({dynamic err, StackTrace stackTrace}) async {
    String message = err.toString();

    await _crashlytics.recordError(err, stackTrace, reason: "unsubscribe error");
    await _firebaseAnalytics.logEvent(name: "unsubscribe_error", parameters: {
      "hash": CryptoUtil.generateMd5(message),
      "message": message.length > 100 ? message.substring(0, 100) : message,
    });
  }

  @override
  Future<void> passwordlessError({dynamic err, StackTrace stackTrace}) async {
    String message = err.toString();

    await _crashlytics.recordError(err, stackTrace, reason: "passwordless error");
    await _firebaseAnalytics.logEvent(name: "passwordless_error", parameters: {
      "hash": CryptoUtil.generateMd5(message),
      "message": message.length > 100 ? message.substring(0, 100) : message,
    });
  }
}
