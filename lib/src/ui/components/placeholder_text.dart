import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PlaceholderText extends StatelessWidget {
  final double fontHeight;
  final double width;

  const PlaceholderText({
    Key key,
    @required this.fontHeight,
    @required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).backgroundColor.withAlpha(100),
      highlightColor: Theme.of(context).backgroundColor,
      child: Container(
        height: fontHeight,
        width: width,
        color: Colors.grey,
      ),
    );
  }
}
