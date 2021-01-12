import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class GraduationButton extends StatelessWidget {
  static const String graduateStudent = "Graduate Student";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        child: Text(
          graduateStudent.i18n.toUpperCase(),
          style: Theme.of(context).textTheme.button,
        ),
        onPressed: () => {},
      ),
    );
  }
}
