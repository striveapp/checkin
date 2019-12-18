import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/resources/stats_repository.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/class_stats.dart';
import 'package:checkin/src/ui/components/lesson_card.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Stats",
      ),
      body: BlocProvider<StatsBloc>(
        create: (context) => StatsBloc(
            userBloc: BlocProvider.of<UserBloc>(context),
            statsRepository: StatsRepository()),
        child: BlocBuilder<StatsBloc, StatsState>(
            builder: (BuildContext context, StatsState state) {
          if (state is StatsUninitialized) {
            return LoadingIndicator();
          }
          if (state is StatsLoaded) {
            return SingleChildScrollView(
              child: Container(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      //TODO: change name of this
                      child: ClassStats(
                        timeSpan: "week",
                        counter: state.attendedLessons.length,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    //TODO: change this with a proper widget
                    Text("Lessons Details", style: Theme.of(context).textTheme.headline.apply(color: Colors.black87),),
                    ...state.attendedLessons
                        .map((lesson) => LessonCard(lesson: lesson))
                        .toList(),
                  ],
                ),
              )),
            );
          }
          return ErrorWidget("Unknown State [$state] received in: stats_page");
        }),
      ),
    );
  }
}
