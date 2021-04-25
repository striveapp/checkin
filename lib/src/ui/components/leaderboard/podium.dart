import 'package:checkin/src/blocs/leaderboard/bloc.dart';
import 'package:checkin/src/models/user_history.dart';
import 'package:checkin/src/ui/components/leaderboard/podium_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class Podium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<LeaderboardBloc, LeaderboardState>(
        builder: (context, state) {
          return state.map(
              leaderboardInitial: (LeaderboardInitial state) => ShimmedPodiumView(),
              leaderboardLoaded: (LeaderboardLoaded state) => state.isAvailable
                  ? PodiumView(
                      podium: state.podium,
                    )
                  : ShimmedPodiumView());
        },
      ),
    );
  }
}

class PodiumView extends StatelessWidget {
  final List<UserHistory> podium;

  const PodiumView({
    Key key,
    this.podium,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: PodiumProfile(
              position: 2,
              profileEmail: podium[1].email,
              color: Color(0xffC0C0C0),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: PodiumProfile(
              position: 1,
              profileEmail: podium.first.email,
              color: Color(0xeeCFB53B),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: PodiumProfile(
              position: 3,
              profileEmail: podium.last.email,
              color: Color(0xeecd7f32),
            ),
          ),
        ),
      ],
    );
  }
}

class ShimmedPodiumView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Shimmer.fromColors(
              baseColor: Theme.of(context).backgroundColor.withAlpha(100),
              highlightColor: Theme.of(context).backgroundColor,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                width: 70,
                height: 70,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Shimmer.fromColors(
              baseColor: Theme.of(context).backgroundColor.withAlpha(100),
              highlightColor: Theme.of(context).backgroundColor,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Shimmer.fromColors(
              baseColor: Theme.of(context).backgroundColor.withAlpha(100),
              highlightColor: Theme.of(context).backgroundColor,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                width: 70,
                height: 70,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
