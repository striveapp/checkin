import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageProvider {
  Future<File> getCropperImage() async {
    PickedFile selectedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    return await ImageCropper.cropImage(cropStyle: CropStyle.circle, sourcePath: selectedImage.path);
  }
}
