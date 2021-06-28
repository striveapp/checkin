import 'package:checkin/src/blocs/user_stats/bloc.dart';
import 'package:checkin/src/config.dart' as config;
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassProgressionIndicator extends StatelessWidget {
  final double size;

  ClassProgressionIndicator({
    Key key,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserStatsBloc, UserStatsState>(
      builder: (BuildContext context, UserStatsState state) {
        return state.map(
            userStatsUninitialized: (UserStatsUninitialized state) => ClassProgressIndicatorView(),
            userStatsLoaded: (UserStatsLoaded state) {
              var numberOfAttendedClasses = state.attendedLessons.length;

              return ClassProgressIndicatorView(
                  numberOfAttendedClasses: numberOfAttendedClasses,
                  percentageOfAttendedClasses:
                      _getAttendancePercentage(numberOfAttendedClasses, state.timespan),
                  size: size);
            });
      },
    );
  }
}

class ClassProgressIndicatorView extends StatelessWidget {
  static const String classes = 'classes';

  final int numberOfAttendedClasses;
  final double percentageOfAttendedClasses;
  final double size;

  ClassProgressIndicatorView({
    Key key,
    this.numberOfAttendedClasses = 0,
    this.percentageOfAttendedClasses = 0,
    this.size = 180,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: (size / 4),
          child: Column(
            children: [
              Text(
                "$numberOfAttendedClasses",
                key: Key("matHours"),
                style: Theme.of(context).textTheme.headline1.apply(
                      fontSizeFactor: size / 100,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              Text(
                classes.plural(numberOfAttendedClasses),
                style: Theme.of(context).textTheme.headline3.apply(
                      fontSizeFactor: size / 150,
                    ),
              ),
            ],
          ),
        ),
        Container(
          width: size,
          height: size,
          child: TweenAnimationBuilder<double>(
            curve: Curves.fastLinearToSlowEaseIn,
            tween: Tween<double>(
              begin: percentageOfAttendedClasses / 2,
              end: percentageOfAttendedClasses,
            ),
            duration: const Duration(milliseconds: 3500),
            builder: (context, value, _) {
              return CircularProgressIndicator(
                strokeWidth: size / 10,
                backgroundColor: Theme.of(context).colorScheme.secondary.withAlpha(100),
                value: value,
                valueColor:
                    new AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.secondary),
              );
            },
          ),
        )
      ],
    );
  }
}

double _getAttendancePercentage(int counter, Timespan timespan) {
  if (timespan == Timespan.week) {
    return counter * 100 / config.TOTAL_MAT_TIME_WEEK / 100;
  } else if (timespan == Timespan.month) {
    return counter * 100 / config.TOTAL_MAT_TIME_MONTH / 100;
  }
  return counter * 100 / config.TOTAL_MAT_TIME_YEAR / 100;
}
