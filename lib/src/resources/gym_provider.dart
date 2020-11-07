import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GymProvider implements GymRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String path = 'gyms';

  Stream<Gym> getGym(String gymId) {
    return _firestore
        .collection(path)
        .doc(gymId)
        .snapshots()
        .where((snapshot) => snapshot.exists)
        .map((gym) {
          return _toGym(gymId, gym.data());
        });
  }

  Gym _toGym(String gymId, Map<String, dynamic> gym) {
    gym.putIfAbsent("id", () => gymId);
    return Gym.fromJson(gym);
  }
}
