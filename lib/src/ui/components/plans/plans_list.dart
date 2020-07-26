import 'package:checkin/src/ui/components/plans/plan_card.dart';
import 'package:flutter/material.dart';

class PlansList extends StatelessWidget {
  const PlansList({
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
          PlanCard(
            name: "8 Session",
            description: "Plus 3 free open mats",
            yearlyPlanPrice: 6300,
          ),
          PlanCard(
            name: "12 Session",
            description: "Plus 3 free open mats",
            yearlyPlanPrice: 7200,
          ),
          PlanCard(
            name: "16 Session",
            description: "Plus 3 free open mats",
            yearlyPlanPrice: 7800,
          ),
          PlanCard(
            name: "Unlimited",
            description: "All sessions",
            yearlyPlanPrice: 9200,
          ),
        ],
      ),
    );
  }
}
