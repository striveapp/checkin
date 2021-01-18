import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserImage extends StatelessWidget {
  final String userImage;
  final double circularRadius;
  final double width;
  final double height;
  final bool withBorder;
  final bool isGrayscale;

  UserImage({
    Key key,
    @required this.userImage,
    this.circularRadius = 50,
    this.width = 50,
    this.height = 50,
    this.withBorder = false,
    this.isGrayscale = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: this.withBorder ? EdgeInsets.all(1.5) : null,
      decoration: BoxDecoration(
          border: Border.all(
              color: this.withBorder ? Theme.of(context).accentColor : Colors.transparent,
              width: 1.5),
          borderRadius: BorderRadius.circular(circularRadius)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(circularRadius),
        child: Builder(
          builder: (BuildContext context) {
            var cachedNetworkImage = CachedNetworkImage(
              imageUrl: userImage,
              width: width,
              height: height,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => Icon(Icons.error),
            );

            return isGrayscale
                ? ColorFiltered(
                    colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
                    child: cachedNetworkImage,
                  )
                : cachedNetworkImage;
          },
        ),
      ),
    );
  }
}
