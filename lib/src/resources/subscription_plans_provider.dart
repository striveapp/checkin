import 'package:checkin/src/models/subscription_plan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubscriptionPlansProvider {
  static const String path = 'subscription_plans';

  //TODO: use only a single instance of firestore https://trello.com/c/LZ79VvWa
  Firestore _firestore = Firestore.instance;

  Stream<List<SubscriptionPlan>> getPlans() {
    return _firestore
        .collection(path)
        .snapshots().map((snap) {
        return snap.documents.map((doc) {
          return SubscriptionPlan(
            name: doc.data['name'],
            description: doc.data['description'],
            code: doc.data['code'],
            currency: doc.data['currency'],
            price: doc.data['price'],
            interval: doc.data['interval'],
          );
        }).toList();
    });
  }

}
