import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final double width;
  final double height;

  const LoadingIndicator({this.width = 40.0, this.height = 40.0});

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox(
          width: width,
          height: height,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
            strokeWidth: 3,
            key: Key('loadingIndicator'),
          ),
        ),
      );
}
