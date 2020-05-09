import 'package:flutter/material.dart';

import '../constants.dart';
import 'api.dart';

class MembershipApi {
  Future<void> unsubscribe() async {
    // todo multigym
    var parameters = {
      'gymId': aranha_gym,
    };
    await Api.call(functionName: "unsubscribe", parameters: parameters )
        .then((_) => {
      debugPrint("User unsubscribed")
    });
  }
}

