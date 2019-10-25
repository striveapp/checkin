import 'package:checkin/src/models/attendee.dart';
import 'package:flutter/material.dart';

import 'api.dart';

class LessonApi {
  Future<void> register(String lessonId, Attendee attendee) async {
    var parameters = {
      'lessonId': lessonId,
      'attendee': attendee.toJson()
    };

    await Api.call(functionName: "register", parameters: parameters)
        .then((_) => {
          debugPrint("User [$attendee] registered from lesson with id [$lessonId]")
        });
  }

  Future<void> unregister(String lessonId, Attendee attendee) async {
    var parameters = {
      'lessonId': lessonId,
      'attendee': attendee.toJson()
    };

    await Api.call(functionName: "unregister", parameters: parameters)
        .then((_) => {
          debugPrint("User [$attendee] unregistered from lesson with id [$lessonId]")
        });
  }

  Future<void> clearLesson(String lessonId) async {
    var parameters = {
      'lessonId': lessonId,
    };

    await Api.call(functionName: "clear", parameters: parameters)
        .then((_) => {
      debugPrint("Lesson with id [$lessonId], cleared")
    });
  }
}

