import 'package:checkin/src/models/subscription_plan.dart';
import 'package:checkin/src/repositories/subscription_plans_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubscriptionPlansProvider implements SubscriptionPlansRepository {
  static const String gymPath = "gyms";
  static const String path = 'subscription_plans';

  //TODO: use only a single instance of firestore https://trello.com/c/LZ79VvWa
  Firestore _firestore = Firestore.instance;

  Stream<List<SubscriptionPlan>> getPlans({String gymId}) => _firestore
      .collection(gymPath)
      .document(gymId)
      .collection(path)
      .snapshots()
      .map((snap) => snap.documents
          .map((doc) => toSubscriptionPlan(doc))
          .toList());

  SubscriptionPlan toSubscriptionPlan(DocumentSnapshot doc) {
    if( doc.data['startingPrice'] != null ) {
      return SubscriptionPlan.subscriptionWithPrices(
          id: doc.documentID,
          name: doc.data['name'],
          description: doc.data['description'],
          currency: doc.data['currency'],
          startingPrice: doc.data['startingPrice']);
    }

    return SubscriptionPlan.simpleSubscription(
              name: doc.data['name'],
              description: doc.data['description'],
              code: doc.data['code'],
              currency: doc.data['currency'],
              price: doc.data['price'],
              interval: doc.data['interval'],
            );
  }
}
