import 'dart:async';

import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/user_history.dart';

abstract class StatsRepository {
  Stream<UserHistory> getUserStats(String gymId, String email, String timespan);

  Stream<List<UserHistory>> getAllUserStats(String gymId);

  Stream<UserHistory> getUserStatsByGrade(String gymId, String email, Grade grade);

}
