import 'package:flutter/material.dart';
import 'package:checkin/src/localization/localization.dart';

class PlansCallout extends StatelessWidget {
  static final String chooseYourPlan = "Choose the plan that better fits your training needs";

  const PlansCallout({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      chooseYourPlan.i18n,
      style: Theme.of(context).textTheme.headline3,
      textAlign: TextAlign.center,
    );
  }
}
