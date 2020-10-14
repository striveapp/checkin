import 'package:checkin/src/blocs/sessions/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/repositories/membership_repository.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendeeTile extends StatelessWidget {
  final Attendee attendee;
  final String selectedGymId;
  final bool isCurrent;
  final bool isAccepted;
  final bool showSessionsWarning;

  static const String you = 'You';
  static const String youHaveNoMoreAvailableSessions =
      'You have no more available sessions';
  static const String thisStudentIsInSessionOverdue =
      'This student is in session overdue';

  const AttendeeTile({
    Key key,
    @required this.attendee,
    @required this.selectedGymId,
    this.isCurrent = false,
    this.isAccepted = false,
    this.showSessionsWarning = false,
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
              withBorder: false,
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
                if (showSessionsWarning && !isAccepted)
                  MultiBlocProvider(
                    providers: [
                      BlocProvider<SessionsBloc>(
                        create: (BuildContext context) => SessionsBloc(
                          statsRepository:
                              RepositoryProvider.of<StatsRepository>(context),
                          userEmail: attendee.email,
                          selectedGymId: selectedGymId,
                          membershipRepository:
                              RepositoryProvider.of<MembershipRepository>(
                                  context),
                        ),
                      )
                    ],
                    child: BlocBuilder<SessionsBloc, SessionsState>(
                        builder: (BuildContext context, SessionsState state) {
                      final message = isCurrent
                          ? youHaveNoMoreAvailableSessions
                          : thisStudentIsInSessionOverdue;
                      return state.maybeWhen(
                          sessionsWarning:
                              (_totalLessonsOfPlan, _attendedLessons) =>
                                  Tooltip(
                                    message: message.i18n,
                                    child: Icon(Icons.warning_amber_rounded,
                                        color: Colors.amber),
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
