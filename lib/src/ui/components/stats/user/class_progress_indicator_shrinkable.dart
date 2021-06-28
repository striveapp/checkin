// @dart=2.9

import 'dart:math' as math;

import 'package:checkin/src/ui/components/stats/user/class_progression_indicator.dart';
import 'package:flutter/material.dart';

class ClassProgressionIndicatorShrinkable extends SliverPersistentHeaderDelegate {
  final double min;
  final double max;

  ClassProgressionIndicatorShrinkable({
    @required this.min,
    @required this.max,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    var currentSize = max - shrinkOffset;
    var size = currentSize >= min ? currentSize - 40 : min - 40;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          //TODO: this is a workaround because of this issue in flutter: https://github.com/flutter/flutter/issues/37578
          BoxShadow(
            color: Theme.of(context).scaffoldBackgroundColor,
            blurRadius: 0.0,
            spreadRadius: 0.0,
            offset: Offset.fromDirection(4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: ClassProgressionIndicator(
          size: size,
        ),
      ),
    );
  }

  @override
  double get minExtent => min;

  @override
  double get maxExtent => math.max(max, min);

  @override
  bool shouldRebuild(ClassProgressionIndicatorShrinkable oldDelegate) {
    return max != oldDelegate.max || min != oldDelegate.min;
  }
}
