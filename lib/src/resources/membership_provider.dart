import 'package:checkin/src/models/membership.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MembershipProvider {
  static const String gymPath = "gyms";
  static const String path = 'customers';

  Firestore _firestore = Firestore.instance;

  Stream<Membership> getMembership(String gymId, String email) {
    return _firestore
        .collection(gymPath)
        .document(gymId)
        .collection(path)
        .document(email)
        .snapshots()
        .where((doc) => doc.data != null)
        .where((doc) => doc.data['infos'] != null)
        .where((doc) => doc.data['subscription'] != null)
        .where((doc) => doc.data['payment_method'] != null)
        .map((doc) => toMembership(doc));
  }

  Membership toMembership(DocumentSnapshot doc) {
    if(doc.data['payment_method']['card'] != null ) {
      return Membership(
        //TODO: we should retrieve the name from the DB
        name: "Puppa",
        status: doc.data['subscription']['status'],
        currentPeriodEnd: doc.data['subscription']['current_period_end'],
      );
    }

    throw Exception("Not supported membership");
  }
}
