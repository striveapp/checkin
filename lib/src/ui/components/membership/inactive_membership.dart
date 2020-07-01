import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class InactiveMembershipView extends StatelessWidget {
  final String email;
  static const String notActiveSubscription =
      'Your subscription is not active yet';
  static const String subscribe = 'Subscribe';

  const InactiveMembershipView({Key key, this.email}) : super(key: key);

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
              style:
                  Theme.of(context).textTheme.headline3.apply(fontSizeDelta: 1),
            ),
            RaisedButton(
              child: Text(
                subscribe.i18n,
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () {
//                PaymentApi(
//                        httpClient:
//                            HttpClient(authRepository: AuthProvider()))
//                    .setupIntent("test", "customerId");
                Navigator.of(context)
                    .pushNamed("subscriptions/$email");
              },
            ),
          ],
        ),
      ),
    );
  }
}
