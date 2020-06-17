import 'package:flutter/material.dart';

class AddPhotoBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(50)),
    child: Center(
      child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            border: Border.all(
                width: 1,
                color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          width: 18,
          height: 18,
          child: Icon(Icons.add, size: 16, color: Colors.white,)),
    ),
  );
}
