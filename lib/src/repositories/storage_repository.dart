import 'dart:io';

abstract class StorageRepository {
  Future<String> uploadImage(File file, String fileName);
}
