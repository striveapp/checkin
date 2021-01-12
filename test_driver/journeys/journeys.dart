import 'dart:async';

import 'package:checkin/main_common.dart' as app;
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/resources/lesson_instances_provider.dart';
import 'package:checkin/src/resources/stats_provider.dart';
import 'package:checkin/src/resources/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:intl/intl.dart';

bool isDbClean = false;
StreamSubscription<Lesson> lessonSub;
bool isHotRestarting = false;

Future<void> main() async {
  enableFlutterDriverExtension(handler: (message) async {
    if (message == "init_hot_restart") {
      isHotRestarting = true;
    }

    if (message == "is_hot_restarting") {
      return isHotRestarting.toString();
    }

    if (message == "setup") {
      await setup();
    } else if (message == "is_db_clean") {
      return isDbClean.toString();
    }
    return "ok";
  });

  app.mainCommon(null);
}

Future<void> setup() async {
  await Firebase.initializeApp();
  var firebaseAuth = FirebaseAuth.instance;
  await firebaseAuth.signOut();
  await firebaseAuth.signInWithEmailAndPassword(
      email: "test@test.com", password: "test123");
  await cleanDatabase();
  await firebaseAuth.signOut();
  debugPrint("Finished setup, db cleaned!");
}

Future<void> cleanDatabase() async {
  String formattedTestDate = DateFormat("yyyy-MM-dd").format(testDate);
  await StatsProvider().cleanUserHistory("test", "test@test.com");
  await StatsProvider().cleanUserHistory("test", "test-two@test.com");
  await StatsProvider().cleanUserHistory("test", "test-master@test.com");
  await StatsProvider().cleanUserHistory("test", "test-owner@test.com");
  await UserProvider().updateGrade("test@test.com", Grade.white);
  await LessonInstancesProvider().cleanLessonAttendees(
      "test", formattedTestDate, "3dbc1886-0c93-4eb3-a815-f4ed69306217");
  await LessonInstancesProvider().cleanLessonAttendees(
      "test", formattedTestDate, "50be7f9f-d8e4-424a-a4d8-2910dbaf68e3");
  await LessonInstancesProvider().cleanLessonAttendees(
      "test", formattedTestDate, "d70c08ba-82c9-47ab-99cc-49d7a890bef4");
  lessonSub = LessonInstancesProvider()
      .getLesson(
          "test", formattedTestDate, "50be7f9f-d8e4-424a-a4d8-2910dbaf68e3")
      .listen((event) {
    isDbClean = event?.attendees?.isEmpty;
  });
}
