// @dart=2.9

import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class PlansFooter extends StatelessWidget {
  static const String note = 'note';
  static const String subscriptionDisclaimer =
      'the prices shown here represent the yearly subscription';

  const PlansFooter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: "${note.i18n}: ",
                style: Theme.of(context).textTheme.caption.apply(fontWeightDelta: 4),
              ),
              TextSpan(
                text: subscriptionDisclaimer.i18n,
                style: Theme.of(context).textTheme.caption,
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
