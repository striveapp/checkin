import 'dart:async';

import 'package:checkin/src/models/gym.dart';

abstract class GymRepository {
  StreamSubscription<Gym> subscribeToGym(String gymId);

  Stream<Gym> getGym();
}
