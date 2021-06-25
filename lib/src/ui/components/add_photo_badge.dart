import 'package:flutter/material.dart';

class AddPhotoBadge extends StatelessWidget {
  final double size;

  const AddPhotoBadge({Key key, this.size = 18}) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        child: Center(
          child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Icon(
                Icons.add,
                size: size,
                color: Colors.white,
              )),
        ),
      );
}
