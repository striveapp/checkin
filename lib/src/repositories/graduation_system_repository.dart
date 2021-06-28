// @dart=2.9

import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/graduation_system.dart';

abstract class GraduationSystemRepository {
  Stream<GraduationSystem> getGraduationSystem(String gymId, Grade grade);
}
