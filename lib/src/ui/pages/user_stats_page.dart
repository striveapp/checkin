import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/blocs/user_stats/bloc.dart';
import 'package:checkin/src/blocs/user_stats/user_stats_bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/ui/components/stats/user/attended_lessons_list.dart';
import 'package:checkin/src/ui/components/stats/user/class_progress_indicator_shrinkable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserStatsPage extends StatelessWidget {
  final User _user;

  UserStatsPage({
    Key key,
    @required User user,
  })  : assert(user != null),
        _user = user,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserStatsBloc(
        statsRepository: context.read<StatsRepository>(),
        userEmail: _user.email,
        selectedGymId: _user.selectedGymId,
        statsBloc: context.read<StatsBloc>(),
      ),
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: ClassProgressionIndicatorShrinkable(
              min: 140,
              max: 220,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          AttendedLessonCards(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 35,
            ),
          ),
        ],
      ),
    );
  }
}
