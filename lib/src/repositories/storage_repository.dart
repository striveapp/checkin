import 'dart:io';

import 'package:checkin/src/resources/storage_provider.dart';

class StorageRepository {
  final _storageProvider = StorageProvider();

  Future<String> uploadImage(File file, String fileName) =>
      _storageProvider.uploadImage(file, fileName);
}