import 'dart:async';

import 'package:checkin/main.dart' as app;
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/resources/lesson_instances_provider.dart';
import 'package:checkin/src/resources/stats_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_driver/driver_extension.dart';

final navigationObserver = NavigatorObserver();
bool isDbClean = false;
StreamSubscription<Lesson> lessonSub;

Future<void> main() async {
  enableFlutterDriverExtension(handler: (message) async {
    if(message == "setup") {
      await setup();
    } else if (message == "is_db_clean") {
      return isDbClean.toString();
    }
    return "ok";
  });
  app.mainTest(navigationObserver);
}

Future<void> setup() async {
  var firebaseAuth = FirebaseAuth.instance;
  await firebaseAuth.signOut();
  await firebaseAuth.signInWithEmailAndPassword(email: "test@test.com", password: "test123");
  await cleanDatabase();
  await firebaseAuth.signOut();
  navigationObserver.navigator.popUntil(ModalRoute.withName('/'));
  debugPrint("Finished setup, db cleaned!");
}

Future<void> cleanDatabase() async {
  await StatsProvider().cleanUserHistory("test@test.com");
  await LessonInstancesProvider().cleanLessonAttendees("2020-03-16", "mj0dLQ18sMM6M9H1KAUo");
  await LessonInstancesProvider().cleanLessonAttendees("2020-03-16", "lfl8kGUo31ezYhCqP3bS");
  lessonSub = LessonInstancesProvider().getLesson("2020-03-16", "lfl8kGUo31ezYhCqP3bS").listen((event) {
    isDbClean = event?.attendees?.isEmpty;
  });
}
