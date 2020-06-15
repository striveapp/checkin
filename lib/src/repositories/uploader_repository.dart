import 'dart:io';

import 'package:checkin/src/resources/uploader_provider.dart';

class UploaderRepository {
  final _uploaderProvider = UploaderProvider();

  Future<String> uploadImage(File file, String fileName) =>
      _uploaderProvider.uploadImage(file, fileName);
}