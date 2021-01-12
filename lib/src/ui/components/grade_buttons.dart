import 'package:checkin/src/models/grade.dart';
import 'package:flutter/material.dart';
import 'grade_card.dart';

class GradeButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: Grade.values
            .map((grade) => Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 8),
                  child: GradeCard(
                    grade: grade,
                  ),
                ))
            .toList());
  }
}
