import 'package:checkin/src/api/http_client.dart';
import 'package:checkin/src/logging/logger.dart';
import 'package:flutter/material.dart';

import 'api.dart';

class MembershipApi {
  final HttpClient _httpClient;

  MembershipApi({
    @required HttpClient httpClient,
  })  : assert(httpClient != null),
        _httpClient = httpClient;

  Future<void> unsubscribe({@required String gymId}) async {
    var parameters = {
      'gymId': gymId,
    };
    await Api.call(functionName: "unsubscribe", parameters: parameters)
        .then((_) => {Logger.log.i("User unsubscribed")})
        .catchError((err, st) => {Logger.log.e("An error happened calling unsubscribe", err, st)});
  }

  Future<void> createSubscription({String gymId, String customerId, String priceId}) async {
    var data = {"customerId": customerId, "priceId": priceId};
    await _httpClient.post(endpoint: "payments/$gymId/create-subscription", body: data);
  }
}
