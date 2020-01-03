import 'package:checkin/src/api/membership_api.dart';

class MembershipRepository {
  final _membershipApi = MembershipApi();

  Future<void> unsubscribe() => _membershipApi.unsubscribe();
}