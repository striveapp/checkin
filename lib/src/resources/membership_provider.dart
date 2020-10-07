import 'package:checkin/src/models/membership.dart';
import 'package:checkin/src/repositories/membership_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MembershipProvider implements MembershipRepository {
  static const String gymPath = "gyms";
  static const String path = 'customers';

  Firestore _firestore = Firestore.instance;

  @override
  Stream<Membership> getMembership({String gymId, String email}) {
    return _firestore
        .collection(gymPath)
        .document(gymId)
        .collection(path)
        .document(email)
        .snapshots()
        .map((doc) => toMembership(doc));
  }

  Membership toMembership(DocumentSnapshot doc) {
    if (doc.data == null) {
      return Membership(status: Membership.INACTIVE_MEMBERSHIP);
    }

    var subscription = doc.data['subscription'];
    var infos = doc.data['infos'];

    if (infos == null) {
      return Membership(status: Membership.INACTIVE_MEMBERSHIP);
    }

    if (subscription == null) {
      return Membership(
        status: Membership.INACTIVE_MEMBERSHIP,
        customerId: infos["id"],
      );
    }

    return Membership(
      status: subscription['status'],
      customerId: infos["id"],
      name: subscription["subscriptionPlanName"] ?? "Unknown Subscription",
      currentPeriodEnd: subscription['current_period_end'],
      totalLessonsOfPlan: (subscription['totalLessonsOfPlan'] as int)?.toDouble() ?? double.infinity,
    );
  }
}
