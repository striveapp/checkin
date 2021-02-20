import 'package:checkin/src/ui/components/add_photo_badge.dart';
import 'package:checkin/src/ui/components/rounded_image.dart';
import 'package:flutter/material.dart';

class EditableImage extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onEdit;
  final bool isGrayscale;

  const EditableImage({
    Key key,
    this.imageUrl,
    this.onEdit,
    this.isGrayscale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onEdit,
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          clipBehavior: Clip.none,
          children: [
            RoundedImage(
              userImage: imageUrl,
              isGrayscale: isGrayscale,
            ),
            if (!isGrayscale)
              Positioned(
                right: -8,
                bottom: -2,
                child: AddPhotoBadge(),
              ),
          ],
        ),
      );
}
