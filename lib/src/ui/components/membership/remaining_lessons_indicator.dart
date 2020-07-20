import 'package:flutter/material.dart';

class RemainingLessonsIndicator extends StatelessWidget {
  final double totalLessonsOfPlan;

  const RemainingLessonsIndicator({Key key, this.totalLessonsOfPlan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LinearProgressIndicator(
            value: 0.3,
            minHeight: 10,
            valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).accentColor),
            backgroundColor: Color(0x241B3FE3),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8, left: 10),
          child: Text("3/${totalLessonsOfPlan == double.infinity ? "∞": totalLessonsOfPlan.toString()}", style: Theme.of(context).textTheme.headline5,),
        )
      ],
    );
  }
}
