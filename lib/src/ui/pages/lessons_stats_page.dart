import 'package:checkin/src/blocs/lessons_stats/lessons_stats_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonsStatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LessonsStatsBloc>(
      create: (BuildContext context) => LessonsStatsBloc(),
      child: Text('lessons stats page')
    );
  }
}