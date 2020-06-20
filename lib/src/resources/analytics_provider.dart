import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/src/widgets/pages.dart';
import 'package:flutter/src/widgets/routes.dart';

class AnalyticsProvider implements AnalyticsRepository {
  final FirebaseAnalytics _firebaseAnalytics = FirebaseAnalytics();

  @override
  RouteObserver<PageRoute> getNavigationObserver() =>
      FirebaseAnalyticsObserver(analytics: _firebaseAnalytics);

  @override
  Future<void> setUserProperties(String uid) async =>
      await _firebaseAnalytics.setUserId(uid);

  Future<void> logLoginWithGoogleSignIn() async =>
      await _firebaseAnalytics.logLogin(loginMethod: "google_sign_in");
}
