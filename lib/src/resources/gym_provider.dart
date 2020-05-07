import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GymProvider implements GymRepository {
  Firestore _firestore = Firestore.instance;
  static const String path = 'gyms';

  Stream<Gym> getGym(String gymId) {
    return _firestore
        .collection(path)
        .document(gymId)
        .snapshots()
        .map((gym) => Gym(
        domain: gym.data["domain"],
        host: gym.data["host"],
        stripePublicKey: gym.data["stripePublicKey"],
    ) );
  }
}

