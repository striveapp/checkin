import 'package:flutter/material.dart';

import 'api.dart';

class MembershipApi {
  Future<void> unsubscribe(String gymId) async {
    var parameters = {
      'gymId': gymId,
    };
    await Api.call(functionName: "unsubscribe", parameters: parameters)
        .then((_) => {debugPrint("User unsubscribed")});
  }
}
