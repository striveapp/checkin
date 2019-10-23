
import 'package:checkin/src/models/attendee.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

class LessonApi {
  CloudFunctions _functions = CloudFunctions.instance;

  //TODO: this should go soon
  Firestore _firestore = Firestore.instance;
  static const String path = 'lessons';

  Future<void> register(String lessonId, Attendee attendee) async {
    debugPrint("User [$attendee] attends lesson with id [$lessonId]");
    await _functions
        .getHttpsCallable(functionName: "register")
        .call(<String, dynamic>{
      'lessonId': lessonId,
      'attendee': attendee.toJson()
    }).catchError((error) {
      debugPrint(
          "Function (register) got an error error: [${error.message}][${error.code}][${error.details}]");
    });
  }

  Future<void> unregister(String lessonId, Attendee attendee) async {
    debugPrint("User [$attendee] removed from lesson with id [$lessonId]");
    await _firestore.collection(path).document(lessonId).updateData({
      'attendees': FieldValue.arrayRemove([
        {
          'name': attendee.name,
          'imageUrl': attendee.imageUrl,
          'grade': attendee.rank,
          'email': attendee.email
        }
      ])
    });
  }

  Future<void> clearLesson(String lessonId) async {
    await _firestore
        .collection(path)
        .document(lessonId)
        .updateData({"attendees": FieldValue.delete()});
  }
}

