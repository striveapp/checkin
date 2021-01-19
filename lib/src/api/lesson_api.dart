import 'package:flutter/material.dart';

import 'api.dart';

class LessonApi {
  Future<void> acceptAll(String gymId, String lessonId, String lessonDate) async {
    var parameters = {'lessonId': lessonId, 'lessonDate': lessonDate, 'gymId': gymId};

    await Api.call(functionName: "acceptAll", parameters: parameters)
        .then((_) => {debugPrint("User accepted from lesson with id [$lessonDate,$lessonId]")});
  }
}
