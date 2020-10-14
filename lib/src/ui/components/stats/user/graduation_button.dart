import 'package:flutter/material.dart';

class GraduationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(child: Text("Graduate Student".toUpperCase(),
        style: Theme.of(context).textTheme.button,
      ), onPressed: () => {},),
    );
  }
}
