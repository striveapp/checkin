import 'package:checkin/src/models/subscription_plan.dart';
import 'package:checkin/src/repositories/subscription_plans_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubscriptionPlansProvider implements SubscriptionPlansRepository {
  static const String gymPath = "gyms";
  static const String path = 'subscription_plans';
  static const String subPlans = 'subPlans';

  //TODO: use only a single instance of firestore https://trello.com/c/LZ79VvWa
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<SubscriptionPlan>> getPlans({String gymId}) => _firestore
      .collection(gymPath)
      .doc(gymId)
      .collection(path)
      .snapshots()
      .map((snap) => snap.docs.map((doc) => toSubscriptionPlan(doc)).toList());

  Stream<List<SubscriptionPlan>> getSubPlans({String gymId, String planId}) =>
      _firestore
          .collection(gymPath)
          .doc(gymId)
          .collection(path)
          .doc(planId)
          .collection(subPlans)
          .snapshots()
          .map((snap) =>
              snap.docs.map((doc) => toSubscriptionPlan(doc)).toList());

  SubscriptionPlan toSubscriptionPlan(DocumentSnapshot doc) {
    final data = doc.data();
    if (data['startingPrice'] != null) {
      return SubscriptionPlan.subscriptionWithPrices(
          id: doc.id,
          name: data['name'],
          description: data['description'],
          currency: data['currency'],
          startingPrice: data['startingPrice']);
    }

    return SubscriptionPlan.simpleSubscription(
      name: data['name'],
      description: data['description'],
      code: data['code'],
      currency: data['currency'],
      price: data['price'],
      interval: data['interval'],
    );
  }
}
