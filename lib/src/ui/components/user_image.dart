import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  final String userImage;
  final double circularRadius;
  final double width;
  final double height;

  UserImage({Key key,
    @required this.userImage,
    this.circularRadius=50,
    this.width=50,
    this.height=50}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(circularRadius),
        child: Image.network(userImage, width: width, height: height));
  }
}
