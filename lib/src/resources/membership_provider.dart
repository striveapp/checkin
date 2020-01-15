import 'package:checkin/src/models/membership.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MembershipProvider {
  static const String path = 'customers';

  Firestore _firestore = Firestore.instance;

  Stream<Membership> getMembership(String email) {
    return _firestore
        .collection(path)
        .document(email)
        .snapshots()
        .map((doc) => Membership(
      status: doc.data['subscription']['status'],
      email: doc.data['infos']['email'],
      currentPeriodEnd: doc.data['subscription']['current_period_end'],
      cardLastFourDigits: doc.data['payment_method']['card']['last4'],
    ));
  }
}
