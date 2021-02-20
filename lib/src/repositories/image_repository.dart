import 'dart:io';

abstract class ImageRepository {
  Future<File> getCroppedImage();
}
