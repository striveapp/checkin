import 'dart:math' as math;

import 'package:checkin/src/blocs/user_stats/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendedLessonsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserStatsBloc, UserStatsState>(
        builder: (BuildContext context, UserStatsState state) {
      return state.map(
        userStatsUninitialized: (UserStatsUninitialized state) =>
            SliverToBoxAdapter(child: EmptyWidget()),
        userStatsLoaded: (UserStatsLoaded state) => state.attendedLessons.length == 0
            ? SliverToBoxAdapter(child: EmptyWidget())
            : SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: AttendedLessonsHeaderDelegate(
                  minHeight: 35,
                  maxHeight: 40,
                ),
              ),
      );
    });
  }
}

class AttendedLessonsHeaderDelegate extends SliverPersistentHeaderDelegate {
  static const String yourClasses = "Your classes";
  final double minHeight;
  final double maxHeight;

  AttendedLessonsHeaderDelegate({
    @required this.minHeight,
    @required this.maxHeight,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox.expand(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Text(
            yourClasses.i18n,
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .headline1
                .apply(fontSizeDelta: (shrinkOffset / 10) * -1),
          ),
        ),
      ),
    );
  }

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  bool shouldRebuild(AttendedLessonsHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight;
  }
}
