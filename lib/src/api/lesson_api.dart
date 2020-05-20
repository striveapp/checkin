import 'package:checkin/src/models/lesson.dart';
import 'package:flutter/material.dart';

import 'api.dart';

class LessonApi {
  Future<void> acceptAll( String gymId, Lesson lesson) async {
    var parameters = {
      'lesson': lesson.toJson(),
      'gymId': gymId
    };

    await Api.call(functionName: "acceptAll", parameters: parameters)
        .then((_) => {
      debugPrint("User accepted from lesson with id [${lesson.id}]")
    });
  }
}

