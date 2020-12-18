import 'package:flutter/material.dart';

class LessonTypeBadge extends StatelessWidget {
  final String lessonType;
  final String color;

  const LessonTypeBadge({
    Key key,
    this.lessonType,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //todo width should be fixed? 50
    return Container(
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: _toColor(color)
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          lessonType,
          overflow: TextOverflow.fade,
          softWrap: false,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1.apply(
                color: _toColor(color),
                fontSizeDelta: -2,
                fontWeightDelta: 3,
              ),
        ),
      ),
    );
  }
}

// todo improve this with our colors
Color _toColor(String color) {
  switch (color) {
    case "yellow":
      return Colors.amber;
    case "red":
      return Colors.red;
    case "purple":
      return Colors.purple;
    default:
      return Colors.yellow;
  }
}
