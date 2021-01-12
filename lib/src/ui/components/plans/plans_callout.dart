import 'package:flutter/material.dart';
import 'package:checkin/src/localization/localization.dart';

class PlansCallout extends StatelessWidget {
  static final String chooseYourSubscription =
      "Choose the subscription that better fits your training needs";

  const PlansCallout({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      chooseYourSubscription.i18n,
      style: Theme.of(context).textTheme.headline3,
      textAlign: TextAlign.center,
    );
  }
}
