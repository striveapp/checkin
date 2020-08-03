import 'package:flutter/material.dart';
import 'package:checkin/src/localization/localization.dart';

class PriceFooter extends StatelessWidget {
  static const String note = 'note';
  static const String pricesDisclaimer = 'you will not be able to reduce the timespan of your subscription';

  const PriceFooter({
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
                text: pricesDisclaimer.i18n,
                style: Theme.of(context).textTheme.caption,
              ),
            ]),
          ),
        ),
      ],
    );
  }
}