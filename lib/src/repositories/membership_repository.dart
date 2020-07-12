import 'package:checkin/src/models/membership.dart';
import 'package:flutter/material.dart';

abstract class MembershipRepository {
  Stream<Membership> getMembership({
    @required String gymId,
    @required String email,
  });
}
