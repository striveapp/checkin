import 'package:checkin/src/api/membership_api.dart';
import 'package:checkin/src/models/membership.dart';
import 'package:checkin/src/resources/membership_provider.dart';

class MembershipRepository {
  final _membershipApi = MembershipApi();
  final _membershipProvider = MembershipProvider();

  Future<void> unsubscribe({String gymId}) => _membershipApi.unsubscribe(gymId);

  Stream<Membership> getMembership(String email) => _membershipProvider.getMembership(email);
}