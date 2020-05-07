import 'dart:async';

import 'package:checkin/main.dart' as app;
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/resources/lesson_instances_provider.dart';
import 'package:checkin/src/resources/stats_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';

bool isDbClean = false;
StreamSubscription<Lesson> lessonSub;
bool isHotRestarting = false;

Future<void> main() async {
  enableFlutterDriverExtension(handler: (message) async {
    if(message == "init_hot_restart") {
      isHotRestarting = true;
    }

    if( message == "is_hot_restarting") {
      return isHotRestarting.toString();
    }

    if(message == "setup") {
      await setup();
    } else if (message == "is_db_clean") {
      return isDbClean.toString();
    }
    return "ok";
  });
  app.main();
}

Future<void> setup() async {
  var firebaseAuth = FirebaseAuth.instance;
  await firebaseAuth.signOut();
  await firebaseAuth.signInWithEmailAndPassword(email: "test@test.com", password: "test123");
  await cleanDatabase();
  await firebaseAuth.signOut();
  debugPrint("Finished setup, db cleaned!");
}

Future<void> cleanDatabase() async {
  await StatsProvider().cleanUserHistory("test@test.com");
  await LessonInstancesProvider().cleanLessonAttendees("2020-05-04", "FLhdKCTv9XzlArDMAwQo");
  await LessonInstancesProvider().cleanLessonAttendees("2020-05-04", "nUtQA4rjEWr7pXeeLChk");
  lessonSub = LessonInstancesProvider().getLesson("2020-05-04", "nUtQA4rjEWr7pXeeLChk").listen((event) {
    isDbClean = event?.attendees?.isEmpty;
  });
}
