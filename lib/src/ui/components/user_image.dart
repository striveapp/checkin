import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserImage extends StatelessWidget {
  final String userImage;
  final double circularRadius;
  final double width;
  final double height;

  UserImage(
      {Key key,
      @required this.userImage,
      this.circularRadius = 50,
      this.width = 50,
      this.height = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(circularRadius),
      child: CachedNetworkImage(
        imageUrl: userImage,
        width: width,
        height: height,
        placeholder: (context, url) => LoadingIndicator(),
        errorWidget: (context, url, error) => new Icon(Icons.error),
      ),
    );
  }
}
