import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GradeButtons extends StatefulWidget {
  final UserBloc userBloc;

  GradeButtons({
    Key key,
    @required this.userBloc,
  }) : super(key: key);

  @override
  State<GradeButtons> createState() => _GradeButtonsState();
}

class _GradeButtonsState extends State<GradeButtons> {
  UserBloc get _userBloc => widget.userBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserEvent, UserState>(
      bloc: _userBloc,
      builder: (BuildContext context, UserState state) {
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
                                  Localization.of(context).getValue(grade.toLowerCase() + '_grade'),
                                  style: TextStyle(
                                      color: (grade == 'White') ? Colors.black : Colors.white,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'Roboto',
                                      fontSize: 22.0
                                  ),
                                ),
                                onPressed: () =>
                                    _onGradeButtonPressed(grade)))))
                    .toList()));
      },
    );
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

  _onGradeButtonPressed(String grade) {
    debugPrint('Grade selected: $grade');
    _userBloc.dispatch(Update(grade: grade));
    //@TODO: this is causing a bug that prevent the user from logging out. Checks: https://github.com/felangel/bloc/issues/119
    Navigator.pushReplacementNamed(context, '/home');
  }
}
