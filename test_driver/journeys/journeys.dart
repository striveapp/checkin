import 'dart:async';

import 'package:checkin/main_dev.dart' as app;
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/resources/lesson_instances_provider.dart';
import 'package:checkin/src/resources/stats_provider.dart';
import 'package:checkin/src/resources/user_provider.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

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
  var dateUtil = DateUtil();
  String formattedTestDate = DateFormat("yyyy-MM-dd").format(testDate);
  await StatsProvider(dateUtil: dateUtil).cleanUserHistory("test", "test@test.com");
  await StatsProvider(dateUtil: dateUtil).cleanUserHistory("test", "test-two@test.com");
  await StatsProvider(dateUtil: dateUtil).cleanUserHistory("test", "test-master@test.com");
  await StatsProvider(dateUtil: dateUtil).cleanUserHistory("test", "test-owner@test.com");
  await UserProvider().updateGrade("test@test.com", Grade.white);
  await UserProvider().updateSelectedGymId("test@test.com", GYM_TEST);
  await LessonInstancesProvider(dateUtil: dateUtil).cleanLessonAttendees("test", formattedTestDate);

  lessonSub = LessonInstancesProvider(dateUtil: dateUtil)
      .getLessonsForDay("test", testDate)
      .listen((lessons) {
    isDbClean = lessons.every((lesson) => lesson?.attendees?.isEmpty);
  });
}
