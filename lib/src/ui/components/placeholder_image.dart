// @dart=2.9

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PlaceholderImage extends StatelessWidget {
  final double width;
  final double height;

  const PlaceholderImage({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.background.withAlpha(100),
      highlightColor: Theme.of(context).colorScheme.background,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
        width: width,
        height: height,
      ),
    );
  }
}
