import 'package:flutter/material.dart';

class ClassCounter extends StatelessWidget {
  final int counter;

  const ClassCounter({Key key, this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          constraints: BoxConstraints.expand(width: 350.0, height: 150.0),
          padding: new EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Total classes",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
              Text(
                this.counter.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
