// @dart=2.9

import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/pages/leaderboard_page.dart';
import 'package:checkin/src/ui/pages/news_list_page.dart';
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
    return BlocBuilder<ProfileBloc, ProfileState>(
        builder: (BuildContext context, ProfileState state) {
      return state.map(
          initialProfileState: (InitialProfileState state) => Scaffold(body: EmptyWidget()),
          profileLoaded: (ProfileLoaded state) {
            var currentUser = state.profileUser;
            if (currentUser.name == null || currentUser.name.isEmpty) {
              return NameSelectionPage(userEmail: currentUser.email);
            }

            if (currentUser.selectedGymId == null) {
              return UnselectedGymPage(userName: currentUser.name);
            }

            if (currentUser.grade == null) {
              return GradePage(userEmail: currentUser.email);
            }

            return DefaultTabController(
                length: 4,
                child: Scaffold(
                  bottomNavigationBar: Material(
                    color: Colors.black87,
                    child: SafeArea(
                      child: TabBar(
                        indicatorColor: Theme.of(context).colorScheme.secondary,
                        tabs: <Widget>[
                          Tab(key: Key("lessonsTab"), icon: Icon(Icons.home)),
                          Tab(key: Key("statsTab"), icon: Icon(Icons.insert_chart)),
                          Tab(key: Key("leaderboardTab"), icon: Icon(Icons.star)),
                          Tab(
                            key: Key("newsListTab"),
                            icon: Icon(Icons.mail),
                          ),
                        ],
                      ),
                    ),
                  ),
                  body: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      LessonsPage(
                        currentUser: currentUser,
                      ),
                      StatsPage(
                        userEmail: currentUser.email,
                      ),
                      LeaderboardPage(),
                      NewsListPage()
                    ],
                  ),
                ));
          });
    });
  }
}
