import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class PaymentSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 40, right: 40, top: 100, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 150,
                  ),
                  SizedBox(height: 20,),
                  Text(
                    Localization.of(context).paymentSuccessful,
                    style: Theme.of(context).textTheme.headline,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    Localization.of(context).disclaimerSubscription30Min,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle
                        .apply(color: Colors.white60),
                  ),
                ],
              ),
              RaisedButton(onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil("account", ModalRoute.withName('/'),);
              }, child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(Localization.of(context).goToAccount, style: Theme.of(context).textTheme.button.apply(fontSizeDelta: 4),),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
