import 'dart:io';

import 'package:checkin/src/resources/image_provider.dart';

class ImageRepository {
  ImageProvider imageProvider = ImageProvider();

  Future<File> getCroppedImage() => imageProvider.getCropperImage();
}
