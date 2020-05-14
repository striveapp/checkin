import 'package:checkin/src/models/subscription_plan.dart';
import 'package:checkin/src/resources/subscription_plans_provider.dart';

class SubscriptionPlansRepository {
  final _subscriptionPlansProvider = SubscriptionPlansProvider();

  Stream<List<SubscriptionPlan>> getPlans(String gymId) => _subscriptionPlansProvider.getPlans(gymId);
}