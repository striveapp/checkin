import 'dart:async';
import 'dart:io';

import 'package:checkin/main_dev.dart' as app;
import 'package:checkin/src/api/lesson_api.dart';
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/resources/lesson_instances_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_test/flutter_test.dart';

bool isDbClean = false;
StreamSubscription<List<Lesson>> lessonSub;
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

  app.main();
}

Future<void> setup() async {
  await Firebase.initializeApp();
  var firebaseAuth = FirebaseAuth.instance;
  await firebaseAuth.signOut();
  await firebaseAuth.signInWithEmailAndPassword(email: "test@test.com", password: "test123");
  await cleanDatabase();
  await firebaseAuth.signOut();
  Logger.log.i("Finished setup, db cleaned!");
}

Future<void> cleanDatabase() async {
  await LessonApi().cleanUpTestGym();
  isDbClean = true;

  // lessonSub = LessonInstancesProvider().getLessonsForDay("test", testDate).listen((lessons) async {
  //   isDbClean = lessons.length == 4 && lessons.every((lesson) => lesson?.attendees?.isEmpty);
  //   if(isDbClean) {
  //     var firebaseAuth = FirebaseAuth.instance;
  //     Logger.log.i("Signing out YO!");
  //     await firebaseAuth.signOut();
  //     await lessonSub.cancel();
  //   }
  // });
}
