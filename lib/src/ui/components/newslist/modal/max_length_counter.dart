import 'package:flutter/material.dart';

class MaxLengthCounter extends StatelessWidget {
  final int remainingChars;
  final double completionPercentage;

  const MaxLengthCounter({
    Key key,
    @required this.remainingChars,
    @required this.completionPercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (remainingChars <= 20)
          Positioned(
            top: 20 / 4,
            child: Text("${remainingChars}",
                key: Key("remainingChars"), style: Theme.of(context).textTheme.bodyText1),
          ),
        SizedBox(
          height: 25,
          width: 25,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Theme.of(context).backgroundColor.withAlpha(70),
            value: completionPercentage,
            valueColor: new AlwaysStoppedAnimation<Color>(
              Theme.of(context).accentColor,
            ),
          ),
        ),
      ],
    );
  }
}
