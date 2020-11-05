import 'dart:core';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Api {
  static Future<HttpsCallableResult> call(
          {functionName: String, dynamic parameters}) =>
      CloudFunctions.instance
          .getHttpsCallable(functionName: functionName)
          .call(parameters)
          .then((result) {
        debugPrint("Successfully invoke Function ($functionName)");
      }).catchError((error, stacktrace) {
        debugPrint("Function ($functionName) got an error");
        debugPrint("Stacktrace:\n $stacktrace }");
        if (error is PlatformException && error.code == 'functionsError') {
          final String code = error.details['code'];
          final String message = error.details['message'];
          // final dynamic details = error.details['details'];
          throw ApiException(message, code);
        }
        debugPrint("Message: ${error.toString()}");
        throw error;
      });
}

class ApiException implements Exception {
  String message;
  String code;

  ApiException([String message, String code]) {
    this.message = message;
    this.code = code;
  }

  @override
  String toString() {
    return 'ApiException{_message: $message, _code: $code}';
  }
}