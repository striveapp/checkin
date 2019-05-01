import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/resources/class_provider.dart';

class ClassRepository {
  final _classProvider = ClassProvider();

  Stream<List<User>> getClassAttendees() => _classProvider.getClassAttendees();

  Future<void> attendClass(User attendee) => _classProvider.attendClass(attendee);

  Future<void> clearClass() => _classProvider.clearClass();
}