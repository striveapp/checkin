import 'package:flutter/material.dart';

abstract class AnalyticsRepository {
  RouteObserver<PageRoute<dynamic>> getNavigationObserver();

  Future<void> setUserProperties(String uid);

  Future<void> logLoginWithGoogleSignIn();

  Future<void> loginError({dynamic err, StackTrace stackTrace});
}
