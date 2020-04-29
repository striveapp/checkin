import 'package:flutter/material.dart';

import 'api.dart';

class MembershipApi {
  Future<void> unsubscribe() async {
    // todo multigym
    var parameters = {
      'gymId': "aranha",
    };
    await Api.call(functionName: "unsubscribe", parameters: parameters )
        .then((_) => {
      debugPrint("User unsubscribed")
    });
  }
}

