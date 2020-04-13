import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
      child: kIsWeb ?
       Image.network(userImage, width: width, height: height, fit: BoxFit.fill,)
      : CachedNetworkImage(
        imageUrl: userImage,
        width: width,
        height: height,
        fit: BoxFit.fill,
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
