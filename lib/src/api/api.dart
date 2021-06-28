// @dart=2.9

import 'dart:core';

import 'package:checkin/src/logging/logger.dart';
import 'package:cloud_functions/cloud_functions.dart';

class Api {
  static Future<HttpsCallableResult> call({functionName: String, dynamic parameters}) {
    return FirebaseFunctions.instance.httpsCallable(functionName).call(parameters).then((result) {
      Logger.log.i("Successfully invoke Function ($functionName)");
    }).catchError((error, stacktrace) {
      Logger.log.e("Function ($functionName) got an error", error, stacktrace);
      if (error is FirebaseFunctionsException) {
        final String code = error.code;
        final String message = error.message;
        // final dynamic details = error.details['details'];
        throw ApiException(message, code);
      }
      throw error;
    });
  }
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
