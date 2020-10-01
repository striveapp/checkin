import 'package:checkin/src/api/http_client.dart';
import 'package:checkin/src/api/membership_api.dart';
import 'package:checkin/src/blocs/membership/bloc.dart';
import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/blocs/user_stats/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/membership.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/resources/auth_provider.dart';
import 'package:checkin/src/resources/membership_provider.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checkin/src/constants.dart' as constants;

class AttendeeTile extends StatelessWidget {
  final Attendee attendee;
  final bool isCurrent;
  final bool isAccepted;
  final bool isOwnerView;

  static const String you = 'You';

  const AttendeeTile({
    Key key,
    @required this.attendee,
    this.isCurrent = false,
    this.isAccepted = false,
    this.isOwnerView = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            key: Key("tile-${attendee.email}"),
            leading: UserImage(
              userImage: attendee.imageUrl,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(
                  "${attendee.name}${this.isCurrent ? " (${you.i18n})" : ""}",
                  style: this.isCurrent
                      ? Theme.of(context).textTheme.headline3.apply(
                          color: Theme.of(context).accentColor.withAlpha(200))
                      : Theme.of(context).textTheme.headline3),
            ),
            trailing: Wrap(
              spacing: 10,
              children: [
                if (isOwnerView)
                  MultiBlocProvider(
                    providers: [
                      BlocProvider<UserStatsBloc>(
                      create: (BuildContext context) => UserStatsBloc(
                        statsRepository:
                        RepositoryProvider.of<StatsRepository>(context),
                        userEmail: attendee.email,
                        selectedGymId: attendee.selectedGymId ?? "you like tacconi?",
                        statsBloc: StatsBloc()
                          ..add(TimespanUpdate(timespan: constants.MONTH)),
                      ),
                    ),
                      BlocProvider<MembershipBloc>(
                      create: (BuildContext context) => MembershipBloc(
                        analyticsRepository:
                        RepositoryProvider.of<AnalyticsRepository>(context),
                        membershipApi: MembershipApi(
                            httpClient:
                            HttpClient(authRepository: AuthProvider())),
                        membershipRepository: MembershipProvider(),
                        userEmail: attendee.email,
                        selectedGymId: attendee.selectedGymId ?? "you like tacconi?",
                      ),
                    )],
                    child: BlocBuilder<MembershipBloc, MembershipState>(
                        builder: (BuildContext context, MembershipState state) {

                          return state.maybeWhen(
                              membershipActive: (Membership membership) =>
                              BlocBuilder<UserStatsBloc,UserStatsState>(
                                builder: (BuildContext context, UserStatsState state) {
                                  if( state is UserStatsLoaded ) {

                                    if( state.attendedLessons.length >= membership.totalLessonsOfPlan) {
                                      return Tooltip(
                                        message: "${attendee.name} used all available lesson for his plan".i18n,
                                        child: Icon(Icons.warning_amber_rounded,
                                            color: Colors.amber),
                                      );
                                    }
                                  }

                                  return SizedBox(width: 1,);
                                },
                              ),
                              orElse: () => SizedBox(
                                    width: 1,
                                  ));
                        }),
                  ),
                Icon(_getAcceptedStateIcon(),
                    color: Theme.of(context).accentColor),
              ],
            ),
            onTap: () async {
              debugPrint("User tapped on ${attendee.name}");
              Navigator.of(context).pushNamed('stats/${attendee.email}');
            },
          ),
        ),
      ],
    );
  }

  _getAcceptedStateIcon() {
    if (this.isAccepted) {
      return Icons.check_circle;
    }

    return Icons.radio_button_unchecked;
  }
}
