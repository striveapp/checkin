import 'dart:convert';

import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/weekday.dart';
import 'package:test/test.dart';

import 'json_model.dart';

void main() {
  group("json test group", () {
    test("json test", () {
      JsonModel jsonModel = JsonModel(simpleField: "test", requiredField: "required");
      Map<String, dynamic> serializedJsonModel = jsonModel.toJson();

      print("toJson: ${jsonEncode(serializedJsonModel)}");

      JsonModel deserializedJsonModel = JsonModel.fromJson(serializedJsonModel);
      print("fromJson: $deserializedJsonModel");
      expect(jsonModel, equals(deserializedJsonModel));
    });

    test("json test default override", () {
      Map<String, dynamic> serializedJsonModel = {
        "simpleField": "test",
        "requiredField": "required",
        "defaultField": false
      };

      print("original json: ${serializedJsonModel}");

      JsonModel deserializedJsonModel = JsonModel.fromJson(serializedJsonModel);
      print("fromJson: $deserializedJsonModel");
      expect(deserializedJsonModel.defaultField, equals(false));
    });

    test("json test custom converter deserializer", () {
      Map<String, dynamic> serializedJsonModel = {
        "requiredField": "required",
        "grade": "Blue",
      };

      print("original json: ${serializedJsonModel}");

      JsonModel deserializedJsonModel = JsonModel.fromJson(serializedJsonModel);
      print("fromJson: $deserializedJsonModel");
      expect(deserializedJsonModel.grade, equals(Grade.blue));
    });

    test("serialization for weekday", () {
      Lesson lesson = Lesson(weekDay: Weekday.monday);

      Map<String, dynamic> actualJson = lesson.toJson();
      Logger.log.i("Json: $actualJson");

      expect(actualJson["weekDay"], equals("monday"));
    });

    test("deserialization for weekday", () {
      Map<String, dynamic> lessonJson = {
        "weekDay": "monday",
      };

      var actualLesson = Lesson.fromJson(lessonJson);

      Logger.log.i("Lesson: $actualLesson");

      expect(actualLesson.weekDay, equals(Weekday.monday));
    });
  });
}
