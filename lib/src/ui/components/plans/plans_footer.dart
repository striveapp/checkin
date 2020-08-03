import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class PlansFooter extends StatelessWidget {
  static const String note = 'note';
  static const String plansDisclaimer = 'the prices shown here represent the yearly plan';

  const PlansFooter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: "${note.i18n}: ",
              style: Theme.of(context).textTheme.caption.apply(fontWeightDelta: 4),
            ),
            TextSpan(
              text: plansDisclaimer.i18n,
              style: Theme.of(context).textTheme.caption,
            ),
          ]),
        ),
      ],
    );
  }
}
