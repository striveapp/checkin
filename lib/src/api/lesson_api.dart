import 'package:checkin/src/models/attendee.dart';
import 'package:flutter/material.dart';

import 'api.dart';

class LessonApi {
  Future<void> acceptAll(String lessonId, List<Attendee> attendees) async {
    final attendeesPayload = attendees.map((attendee) => attendee.toJson()).toList();
    var parameters = {
      'lessonId': lessonId,
      'attendees': attendeesPayload
    };

    await Api.call(functionName: "acceptAll", parameters: parameters)
        .then((_) => {
      debugPrint("User accepted from lesson with id [$lessonId]")
    });
  }
}

