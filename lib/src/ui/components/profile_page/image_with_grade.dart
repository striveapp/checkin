// @dart=2.9

import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';

class ImageWithGrade extends StatelessWidget {
  final Grade grade;
  final double size;

  const ImageWithGrade({
    Key key,
    @required this.grade,
    this.size = 90,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: UserImage(
            width: size,
            height: size,
          ),
        ),
        Positioned(
          top: size - 5,
          right: size / 2 - 2.5,
          child: Container(
            width: size / 2 - 5,
            height: size / 2 - 5,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withAlpha(80),
              shape: BoxShape.circle,
            ),
            child: grade.icon,
          ),
        ),
      ],
    );
  }
}
