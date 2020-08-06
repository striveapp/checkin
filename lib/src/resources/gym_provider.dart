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
        .where((snapshot) => snapshot.exists)
        .map((gym) => Gym(
              id: gymId,
              paymentAppDomain: gym.data["paymentAppDomain"],
              host: gym.data["host"],
              stripePublicKey: gym.data["stripePublicKey"],
            ));
  }
}
