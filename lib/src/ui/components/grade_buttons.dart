import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'grade_card.dart';

class GradeButtons extends StatelessWidget {
  final String userEmail;

  const GradeButtons({Key key, this.userEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: Grade.values
            .map((grade) => Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 8),
                  child: GradeCard(
                    grade: grade,
                    onPressed: () {
                      context
                          .read<ProfileBloc>()
                          .add(UpdateGrade(userEmail: userEmail, newGrade: grade));
                    },
                  ),
                ))
            .toList());
  }
}
