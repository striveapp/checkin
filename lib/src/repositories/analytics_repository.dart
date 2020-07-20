import 'package:flutter/material.dart';

abstract class AnalyticsRepository {
  RouteObserver<PageRoute<dynamic>> getNavigationObserver();

  Future<void> setUserProperties(String uid);

  Future<void> logLoginWithGoogleSignIn();

  Future<void> logLoginWithAppleSignIn();

  Future<void> loginError({dynamic err, StackTrace stackTrace});

  Future<void> logSubscriptionWithEmptyCustomer({String priceId, String gymId});

  Future<void> subscriptionError({dynamic err, StackTrace stackTrace});

  Future<void> unsubscribeError({dynamic err, StackTrace stackTrace});
}
