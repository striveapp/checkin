import 'package:checkin/src/models/membership.dart';
import 'package:checkin/src/repositories/membership_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MembershipProvider implements MembershipRepository {
  static const String gymPath = "gyms";
  static const String path = 'customers';

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<Membership> getMembership({String gymId, String email}) {
    return _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(email)
        .snapshots()
        .map((doc) => toMembership(doc));
  }

  Membership toMembership(DocumentSnapshot doc) {
    final data = doc.data();

    if (data == null) {
      return Membership(status: Membership.INACTIVE_MEMBERSHIP);
    }

    var subscription = data['subscription'];
    var infos = data['infos'];

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
      totalLessonsOfPlan:
          (subscription['totalLessonsOfPlan'] as int)?.toDouble() ?? double.infinity,
    );
  }
}
