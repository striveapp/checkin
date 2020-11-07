import 'package:flutter/material.dart';

import 'api.dart';

class LessonApi {
  Future<void> acceptAll(String gymId, String lessonId, String date) async {
    var parameters = {
      'lessonId': lessonId,
      'date': date,
      'gymId': gymId
    };

    await Api.call(functionName: "acceptAll", parameters: parameters)
        .then((_) => {
      debugPrint("User accepted from lesson with id [$date,$lessonId]")
    });
  }
}

