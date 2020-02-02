import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/grade_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GradePage extends StatelessWidget {
  static const String beltSelection = 'What\'s your belt?';

  GradePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                beltSelection.i18n,
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .apply(color: Colors.black, fontSizeFactor: 1.3),
              ),
            ),
            Expanded(child: GradeButtons()),
          ],
        ),
      ),
    ));
  }
}
