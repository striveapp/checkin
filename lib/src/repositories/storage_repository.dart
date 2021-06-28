// @dart=2.9

import 'dart:io';

abstract class StorageRepository {
  Future<String> uploadImage(File file, String fileName);
}
