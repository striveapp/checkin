import 'package:flutter/material.dart';

abstract class AnalyticsRepository {
  RouteObserver<PageRoute<dynamic>> getNavigationObserver();

  Future<void> setUserProperties(String uid);

  Future<void> logLoginWithGoogleSignIn();
}
