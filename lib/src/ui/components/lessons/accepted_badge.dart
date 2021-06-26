import 'package:flutter/material.dart';

class AcceptedBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        child: Container(
            width: 12,
            height: 12,
            color: Theme.of(context).colorScheme.secondary,
            child: Center(
                //
                child: Icon(
              Icons.check,
              size: 10,
              color: Colors.white,
            ))),
      );
}
