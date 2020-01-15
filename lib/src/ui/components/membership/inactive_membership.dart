import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class InactiveMembershipView extends StatelessWidget {
  final String email;

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
            Text(Localization.of(context).notActiveSubscription,
              style: Theme.of(context)
                .textTheme
                .subtitle
                .apply(fontSizeDelta: 1),),
            RaisedButton(
              child: Text(
                Localization.of(context).subscribe,
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () {
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
