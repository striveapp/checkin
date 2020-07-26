import 'package:checkin/src/ui/components/plans/price/price_card.dart';
import 'package:flutter/material.dart';

class PriceList extends StatelessWidget {
  const PriceList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height,
      ),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        children: [
          PriceCard(
            name: "Yearly",
            description: "Commit to all the year, pay monthly",
            price: 6300,
          ),
          PriceCard(
            name: "Half-yearly",
            description: "Commit to half a year, pay monthly",
            price: 6700,
          ),
          PriceCard(
            name: "Quarterly",
            description: "Commit to a quarter of year, pay monthly",
            price: 7100,
          ),
          PriceCard(
            name: "Monthly",
            description: "Pay month by month",
            price: 7500,
          ),
        ],
      ),
    );
  }
}
