import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/util/crypto_util.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/src/widgets/pages.dart';
import 'package:flutter/src/widgets/routes.dart';

class AnalyticsProvider implements AnalyticsRepository {
  final FirebaseAnalytics _firebaseAnalytics = FirebaseAnalytics();
  final Crashlytics _crashlytics = Crashlytics.instance;

  @override
  RouteObserver<PageRoute> getNavigationObserver() =>
      FirebaseAnalyticsObserver(analytics: _firebaseAnalytics);

  @override
  Future<void> setUserProperties(String uid) async =>
      await _firebaseAnalytics.setUserId(uid);

  Future<void> logLoginWithGoogleSignIn() async =>
      await _firebaseAnalytics.logLogin(loginMethod: "google_sign_in");

  @override
  Future<void> logLoginWithAppleSignIn() async {
    await _firebaseAnalytics.logLogin(loginMethod: "apple_sign_in");
  }

  Future<void> loginError({dynamic err, StackTrace stackTrace}) async {
    String message = err.toString();

    await _crashlytics.recordError(err, stackTrace, context: "login error");
    await _firebaseAnalytics.logEvent(name: "login_error", parameters: {
      "hash": CryptoUtil.generateMd5(message),
      "message": message.substring(0, 100),
    });
  }

  Future<void> logSubscriptionWithEmptyCustomer(
          {String gymId, String priceId}) async =>
      await _firebaseAnalytics
          .logEvent(name: "subscription_with_empty_customer", parameters: {
        "gymId": gymId,
        "priceId": priceId,
      });

  Future<void> subscriptionError({dynamic err, StackTrace stackTrace}) async {
    String message = err.toString();

    await _crashlytics.recordError(err, stackTrace,
        context: "subscription error");
    await _firebaseAnalytics.logEvent(name: "subscription_error", parameters: {
      "hash": CryptoUtil.generateMd5(message),
      "message": message.substring(0, 100),
    });
  }

  Future<void> unsubscribeError({dynamic err, StackTrace stackTrace}) async {
    String message = err.toString();

    await _crashlytics.recordError(err, stackTrace,
        context: "unsubscribe error");
    await _firebaseAnalytics.logEvent(name: "unsubscribe_error", parameters: {
      "hash": CryptoUtil.generateMd5(message),
      "message": message.substring(0, 100),
    });
  }

}
