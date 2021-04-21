import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/pages/leaderboard_page.dart';
import 'package:checkin/src/ui/pages/onboarding/name_selection_page.dart';
import 'package:checkin/src/ui/pages/onboarding/unselected_gym_page.dart';
import 'package:checkin/src/ui/pages/stats_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'lessons_page.dart';
import 'onboarding/grade_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (BuildContext context, UserState state) {
      if (state is UserLoading) {
        return Scaffold(body: LoadingIndicator());
      }
      if (state is UserError) {
        return ErrorWidget("Unexpected UserError [$state]");
      }

      if (state is UserSuccess) {
        if (state.currentUser.name == null || state.currentUser.name.isEmpty) {
          return NameSelectionPage(userEmail: state.currentUser.email);
        }

        if (state.currentUser.selectedGymId == null) {
          return UnselectedGymPage(
            userName: state.currentUser.name,
          );
        }

        if (state.currentUser.grade == null) {
          return GradePage();
        }

        return DefaultTabController(
            length: 3,
            child: Scaffold(
              bottomNavigationBar: Material(
                color: Colors.black87,
                child: SafeArea(
                  child: TabBar(
                    tabs: <Widget>[
                      Tab(key: Key("lessonsTab"), icon: Icon(Icons.home)),
                      Tab(key: Key("statsTab"), icon: Icon(Icons.insert_chart)),
                      Tab(key: Key("leaderboardTab"), icon: Icon(Icons.star)),
                    ],
                  ),
                ),
              ),
              body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  LessonsPage(
                    currentUser: state.currentUser,
                  ),
                  StatsPage(
                    userEmail: state.currentUser.email,
                  ),
                  LeaderboardPage(),
                ],
              ),
            ));
      }
      return ErrorWidget("Unknown State [$state] received in: home_page");
    });
  }
}
