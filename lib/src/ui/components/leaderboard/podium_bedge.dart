// @dart=2.9

import 'package:flutter/material.dart';

class PodiumBedge extends StatelessWidget {
  final Color color;
  final String text;

  const PodiumBedge({Key key, this.color, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        child: Container(
            width: 25,
            height: 25,
            color: color,
            child: Center(
                child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4.apply(
                    fontSizeFactor: 0.6,
                    color: Colors.white,
                    fontWeightDelta: 2,
                  ),
            ))),
      );
}
