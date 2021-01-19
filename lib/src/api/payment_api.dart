import 'package:checkin/src/api/http_client.dart';
import 'package:flutter/material.dart';

class PaymentApi {
  final HttpClient _httpClient;

  PaymentApi({
    @required HttpClient httpClient,
  })  : assert(httpClient != null),
        _httpClient = httpClient;

  Future<String> setupIntent({
    String gymId,
    String customerEmail,
  }) async {
    Map<String, String> data = {"email": customerEmail};

    var result =
        await _httpClient.post(endpoint: "payments/$gymId/create-setup-intent", body: data);

    String clientSecret = result["clientSecret"];
    print("clientSecret $clientSecret");
    return clientSecret;
  }
}
