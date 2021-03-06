import 'package:checkin/src/models/subscription_plan.dart';

abstract class SubscriptionPlansRepository {
  Stream<List<SubscriptionPlan>> getPlans({required String gymId});

  Stream<List<SubscriptionPlan>> getSubPlans({
    required String gymId,
    required String planId,
  });
}
