import 'package:checkin/src/models/lesson.dart';
import 'package:flutter/material.dart';

import 'api.dart';

class LessonApi {
  Future<void> acceptAll(Lesson lesson) async {
    //todo: multigym
    var parameters = {
      'lesson': lesson.toJson(),
    };

    await Api.call(functionName: "acceptAll", parameters: parameters)
        .then((_) => {
      debugPrint("User accepted from lesson with id [${lesson.id}]")
    });
  }
}

