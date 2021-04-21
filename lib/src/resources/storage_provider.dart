import 'dart:io';

import 'package:checkin/src/config.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/util/debug_util.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageProvider implements StorageRepository {
  FirebaseStorage _firebaseStorage =
      FirebaseStorage.instanceFor(bucket: isInDebugMode ? TEST_STORAGE_BUCKET : STORAGE_BUCKET);

  Future<String> uploadImage(File file, String fileName) async {
    String filePath = 'images/$fileName';
    Reference storageRef = _firebaseStorage.ref().child(filePath);

    await storageRef.putFile(file);

    return await storageRef.getDownloadURL();
  }
}
