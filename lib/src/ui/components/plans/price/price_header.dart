import 'package:flutter/material.dart';

class PriceHeader extends StatelessWidget {
  const PriceHeader({
    Key key,
  }) : super(key: key);

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
            Text("8 Sessions", style: Theme.of(context).textTheme.headline2,),
            SizedBox(height: 5,),
            Text("Plus 3 open mats", style: Theme.of(context).textTheme.subtitle1, )
          ],
        ),
      ),
    );
  }
}