import 'dart:convert';
import 'dart:io';

import 'package:checkin/src/config.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/util/debug_util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpClient {
  final AuthRepository _authRepository;

  HttpClient({
    @required AuthRepository authRepository,
  })  : assert(authRepository != null),
        _authRepository = authRepository;

  Future<dynamic> post({endpoint: String, dynamic body}) async {
    String baseUrl = isInDebugMode ? TEST_CLOUD_FUNCTIONS_DOMAIN : CLOUD_FUNCTIONS_DOMAIN;
    Uri functionUrl = Uri.parse("$baseUrl/$endpoint");
    String token = await _authRepository.getIdToken();

    Map<String, String> headers = {HttpHeaders.authorizationHeader: "Bearer $token"};

    Response response = await http.post(functionUrl, body: body, headers: headers);

    if (response.statusCode != 201) {
      throw Exception(
          'Request failed with code [${response.statusCode}], Reason: [${response.body}]');
    }

    return jsonDecode(response.body);
  }
}
