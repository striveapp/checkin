import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/grade_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GradePage extends StatelessWidget {
  static const String beltSelection = 'What\'s your belt?';
  final User currentUser;

  GradePage({
    Key key,
    @required this.currentUser,
  })
      : assert(currentUser != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Text(
            beltSelection.i18n,
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 32.0),
          ),
        ),
        GradeButtons(),
      ],
    ));
  }
}
