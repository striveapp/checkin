import 'package:flutter/material.dart';

import 'api.dart';

class MembershipApi {
  Future<void> unsubscribe() async {
    await Api.call(functionName: "unsubscribe")
        .then((_) => {
      debugPrint("User unsubscribed")
    });
  }
}

