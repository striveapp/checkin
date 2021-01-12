import 'package:flutter/material.dart';

class PriceHeader extends StatelessWidget {
  final String name;
  final String description;

  const PriceHeader(
      {Key key, @required String this.name, @required String this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor.withAlpha(80),
          border: Border.all(color: Theme.of(context).accentColor),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.subtitle1,
            )
          ],
        ),
      ),
    );
  }
}
