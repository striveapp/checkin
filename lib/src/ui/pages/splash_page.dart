import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
      alignment: Alignment.center,
      decoration: new BoxDecoration(
          image: new DecorationImage(
        image: new AssetImage("assets/images/trianglify.png"),
        fit: BoxFit.cover,
      )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: new EdgeInsets.symmetric(vertical: 50),
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 150.0,
                ),
              ),
              LoadingIndicator()
            ],
          ),
    ));
  }
}