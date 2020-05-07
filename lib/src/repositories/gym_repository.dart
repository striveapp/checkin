import 'package:checkin/src/models/gym.dart';

abstract class GymRepository {
  Stream<Gym> getGym(String gymId);
}