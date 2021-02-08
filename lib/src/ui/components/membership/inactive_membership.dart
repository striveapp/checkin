import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class InactiveMembershipView extends StatelessWidget {
  final String email;
  final String customerId;
  static const String notActiveSubscription = 'Your subscription is not active yet';
  static const String chooseYourSubscription = 'Choose your subscription';

  const InactiveMembershipView({
    Key key,
    this.email,
    this.customerId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              notActiveSubscription.i18n,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3.apply(fontSizeDelta: 1),
            ),
            ElevatedButton(
              child: Text(
                chooseYourSubscription.i18n,
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed("plans/$customerId");
              },
            ),
          ],
        ),
      ),
    );
  }
}
