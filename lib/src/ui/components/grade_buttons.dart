import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GradeButtons extends StatelessWidget {
  static const String whiteGrade = 'White';
  static const String blueGrade = 'Blue';
  static const String purpleGrade = 'Purple';
  static const String brownGrade = 'Brown';
  static const String blackGrade = 'Black';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, UserState state) {
        _onPressed(String grade) {
          BlocProvider.of<UserBloc>(context)..add(UpdateGrade(newGrade: grade));
        }

        return Container(
            margin: EdgeInsets.only(top: 40.0),
            child: Column(
                children: User.ranks
                    .map((grade) => Container(
                    padding: EdgeInsets.only(top: 20.0),
                    child: ButtonTheme(
                        height: 50.0,
                        minWidth: 240.0,
                        buttonColor: _getColor(grade),
                        padding: const EdgeInsets.all(0.0),
                        child: RaisedButton(
                            child: Text(
                              grade.i18n,
                              style: TextStyle(
                                  color: (grade == 'White') ? Colors.black : Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 22.0
                              ),
                            ),
                            onPressed: () => _onPressed(grade)))))
                    .toList()));
      },
    );
  }
}

_getColor(String grade) {
  switch(grade) {
    case 'White':
      return Colors.white;
    case 'Blue':
      return Colors.blueAccent;
    case 'Purple':
      return Colors.purple;
    case 'Brown':
      return Colors.brown;
    case 'Black':
      return Colors.black87;
  }
}