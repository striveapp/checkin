// @dart=2.9

import 'dart:io';

abstract class ImageRepository {
  Future<File> getCroppedImage();
}
