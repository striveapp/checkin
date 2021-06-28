// @dart=2.9

import 'package:checkin/src/ui/components/add_photo_badge.dart';
import 'package:checkin/src/ui/components/rounded_image.dart';
import 'package:flutter/material.dart';

class EditableImage extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onEdit;
  final bool isGrayscale;
  final double size;

  const EditableImage({
    Key key,
    this.imageUrl,
    this.onEdit,
    this.isGrayscale = false,
    this.size = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onEdit,
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
          clipBehavior: Clip.none,
          children: [
            RoundedImage(
              url: imageUrl,
              isGrayscale: isGrayscale,
              width: size,
              height: size,
            ),
            if (!isGrayscale)
              Positioned(
                top: size * .8,
                child: AddPhotoBadge(
                  size: size / 4,
                ),
              ),
          ],
        ),
      );
}
