import 'dart:convert';

import 'package:checkin/src/models/grade.dart';
import 'package:test/test.dart';

import 'json_model.dart';

void main() {
  group("json test group", () {
    test("json test", () {
      JsonModel jsonModel =
          JsonModel(simpleField: "test", requiredField: "required");
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
  });
}
