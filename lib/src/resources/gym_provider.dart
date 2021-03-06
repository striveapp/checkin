import 'dart:async';

import 'package:checkin/src/config.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:checkin/src/resources/local_storage_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GymProvider implements GymRepository {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  LocalStorageProvider _localStorageProvider = LocalStorageProvider();

  static const String path = 'gyms';

  @override
  StreamSubscription<Gym> subscribeToGym(String gymId) {
    return _firestore
        .collection(path)
        .doc(gymId)
        .snapshots()
        .where((snapshot) => snapshot.exists)
        .map((gym) => _toGym(gymId, gym.data()))
        .listen((gym) => _localStorageProvider.setGym(gym));
  }

  Stream<Gym> getGym() {
    return _localStorageProvider.getGym();
  }

  Gym _toGym(String gymId, Map<String, dynamic> gym) {
    gym.putIfAbsent("id", () => gymId);
    gym.putIfAbsent("imageUrl", () => DEFAULT_GYM_IMAGE_URL);
    return Gym.fromJson(gym);
  }
}
