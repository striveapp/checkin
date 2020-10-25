import 'package:checkin/src/models/grade.dart';
import 'package:flutter/material.dart';

class GraduationPreview extends StatelessWidget {
  final Grade currentGrade;
  final Grade newGrade;

  const GraduationPreview({
    Key key,
    @required this.currentGrade,
    @required this.newGrade,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        currentGrade.icon,
        Icon(Icons.double_arrow_outlined, color: Theme.of(context).accentColor, size: 35,),
        newGrade.icon,
      ],
    );
  }
}