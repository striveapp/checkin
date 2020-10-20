import 'package:flutter/material.dart';

class GraduateFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.add),
        label: Text(
          "Graduate Student".toUpperCase(),
          style: Theme.of(context).textTheme.button,
        ));
  }
}
