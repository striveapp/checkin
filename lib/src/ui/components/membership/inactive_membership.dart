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
            Text("Your subscription is not active",
              style: Theme.of(context)
                .textTheme
                .subtitle
                .apply(fontSizeDelta: 1),),
            RaisedButton(
              child: Text(
                "Subscribe",
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
