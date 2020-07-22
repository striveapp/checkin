import 'package:checkin/src/blocs/user_stats/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemainingLessonsIndicator extends StatelessWidget {
  final double totalLessonsOfPlan;

  const RemainingLessonsIndicator({Key key, this.totalLessonsOfPlan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserStatsBloc,UserStatsState>(
      builder: (BuildContext context, UserStatsState state) {
        if( state is UserStatsLoaded ) {
          return Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: state.attendedLessons.length / totalLessonsOfPlan,
                  minHeight: 10,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).accentColor),
                  backgroundColor: Color(0x241B3FE3),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 10),
                child: Text("${state.attendedLessons.length}/${totalLessonsOfPlan == double.infinity ? "∞": totalLessonsOfPlan.toStringAsFixed(0)}", style: Theme.of(context).textTheme.headline5,),
              )
            ],
          );
        }
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
              child: Text("3/${totalLessonsOfPlan == double.infinity ? "∞": totalLessonsOfPlan.toStringAsFixed(0)}", style: Theme.of(context).textTheme.headline5,),
            )
          ],
        );
      },
    );
  }
}
