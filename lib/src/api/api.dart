import 'dart:core';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

export 'package:checkin/src/api/lesson_api.dart';

class Api {
  static Future<HttpsCallableResult> call(
          {functionName: String, dynamic parameters}) =>
      CloudFunctions.instance
          .getHttpsCallable(functionName: functionName)
          .call(parameters)
          .then((result) {
        debugPrint("Sucesfully invoke Function ($functionName)");
      }).catchError((error) {
        debugPrint("Function ($functionName) got an error");
        debugPrint("Message: ${error?.message}");
        debugPrint("Stacktrace:\n ${error?.stackTrace} }");
        throw error;

      });
}