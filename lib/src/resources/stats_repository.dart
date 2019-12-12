import 'dart:async';

import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/resources/stats_provider.dart';

class StatsRepository {
  final _statsProvider = StatsProvider();

  Stream<UserHistory> getUserStats(String email) =>
      _statsProvider.getUserStats(email);
}
