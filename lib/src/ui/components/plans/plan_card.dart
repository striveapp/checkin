import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/plans/price.dart';
import 'package:flutter/material.dart';

class PlanCard extends StatelessWidget {
  final String _name;
  final String _description;
  final int _yearlyPlanPrice;

  const PlanCard({
    Key key,
    @required String name,
    @required String description,
    @required int yearlyPlanPrice,
  })  : assert(name != null && description != null && yearlyPlanPrice != null),
        _name = name,
        _description = description,
        _yearlyPlanPrice = yearlyPlanPrice,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        constraints: BoxConstraints(
          minHeight: 100,
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed("price");
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 200,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _name,
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .apply(fontSizeFactor: 1.2, color: Colors.black87),
                      ),
                      Text(
                        _description.i18n,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
                Price(price: _yearlyPlanPrice,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
