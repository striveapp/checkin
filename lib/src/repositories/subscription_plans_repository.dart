import 'package:checkin/src/models/subscription_plan.dart';
import 'package:flutter/material.dart';

abstract class SubscriptionPlansRepository {
  Stream<List<SubscriptionPlan>> getPlans({@required String gymId});
}