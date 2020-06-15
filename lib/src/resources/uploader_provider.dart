import 'dart:io';

import 'package:checkin/src/util/debug_util.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../config.dart';

class UploaderProvider {
  FirebaseStorage firebaseStorage = FirebaseStorage(
      storageBucket: isInDebugMode ? TEST_STORAGE_BUCKET : STORAGE_BUCKET);

  Future<String> uploadImage(File file, String fileName) async {
    String filePath = 'images/$fileName';
    StorageReference storageRef = firebaseStorage.ref().child(filePath);
    await storageRef.putFile(file).onComplete;

    return await storageRef.getDownloadURL();
  }
}
