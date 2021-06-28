// @dart=2.9

import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Price extends StatelessWidget {
  static final String monthly = "mo";

  final int _price;

  const Price({
    Key key,
    @required int price,
  })  : assert(price != null),
        _price = price,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: "€",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .apply(fontSizeFactor: 1.7, color: Theme.of(context).colorScheme.secondary)),
            TextSpan(
                text: _formatPrice(_price),
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .apply(fontSizeFactor: 1.7, color: Theme.of(context).colorScheme.secondary)),
          ]),
        ),
        Text("/${monthly.i18n}", style: Theme.of(context).textTheme.headline5),
      ],
    );
  }

  String _formatPrice(int price) {
    final f = NumberFormat("###.00");
    final s = f.format(price / 100);
    return s.endsWith('00') ? s.substring(0, s.length - 3) : s;
  }
}
