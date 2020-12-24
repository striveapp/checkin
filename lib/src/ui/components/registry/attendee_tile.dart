import 'package:checkin/src/blocs/graduation/bloc.dart';
import 'package:checkin/src/blocs/sessions/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/repositories/graduation_system_repository.dart';
import 'package:checkin/src/repositories/membership_repository.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/registry/attendee_thumbnail.dart';
import 'package:checkin/src/ui/components/registry/dismissible_cue.dart';
import 'package:checkin/src/util/graduation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendeeTile extends StatelessWidget {
  final Attendee attendee;
  final String selectedGymId;
  final bool isCurrent;
  final bool isAccepted;
  final bool showSessionsWarning;
  final bool showGraduationIndication;
  final bool showDismissibleCue;

  static const String you = 'You';
  static const String youHaveNoMoreAvailableSessions = 'You have no more available sessions';
  static const String thisStudentIsInSessionOverdue = 'This student is in session overdue';

  const AttendeeTile({
    Key key,
    @required this.attendee,
    @required this.selectedGymId,
    this.isCurrent = false,
    this.isAccepted = false,
    this.showSessionsWarning = false,
    this.showGraduationIndication = false,
    this.showDismissibleCue = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SessionsBloc>(
          create: (BuildContext context) => SessionsBloc(
            membershipRepository: RepositoryProvider.of<MembershipRepository>(context),
            statsRepository: RepositoryProvider.of<StatsRepository>(context),
            userEmail: attendee.email,
            selectedGymId: selectedGymId,
          ),
        ),
        BlocProvider<GraduationBloc>(
          create: (BuildContext context) => GraduationBloc(
            graduationSystemRepository: RepositoryProvider.of<GraduationSystemRepository>(context),
            statsRepository: RepositoryProvider.of<StatsRepository>(context),
            userRepository: RepositoryProvider.of<UserRepository>(context),
            graduationUtils: GraduationUtil(),
            userEmail: attendee.email,
            userGrade: attendee.grade,
            gymId: selectedGymId,
          )..add(InitializeGraduation()),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              key: Key("tile-${attendee.email}"),
              leading: AttendeeThumbnail(
                attendeeImage: attendee.imageUrl,
                showGraduationIndication: showGraduationIndication,
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text("${attendee.name}${this.isCurrent ? " (${you.i18n})" : ""}",
                    style: this.isCurrent
                        ? Theme.of(context)
                            .textTheme
                            .headline3
                            .apply(color: Theme.of(context).accentColor.withAlpha(200))
                        : Theme.of(context).textTheme.headline3),
              ),
              trailing: Wrap(
                children: [
                  Wrap(
                    spacing: 10,
                    children: [
                      if (showSessionsWarning && !isAccepted)
                        BlocBuilder<SessionsBloc, SessionsState>(
                            builder: (BuildContext context, SessionsState state) {
                          final message = isCurrent
                              ? youHaveNoMoreAvailableSessions
                              : thisStudentIsInSessionOverdue;
                          return state.maybeWhen(
                              sessionsWarning: (_totalLessonsOfPlan, _attendedLessons) => Tooltip(
                                    message: message.i18n,
                                    child: Icon(Icons.warning_amber_rounded, color: Colors.amber),
                                  ),
                              orElse: () => EmptyWidget());
                        }),
                      if (this.isAccepted)
                        Icon(Icons.check_circle, color: Theme.of(context).accentColor),
                    ],
                  ),
                  if (this.showDismissibleCue && !this.isAccepted) DismissibleCue()
                ],
              ),
              onTap: () async {
                debugPrint("User tapped on ${attendee.name}");
                Navigator.of(context).pushNamed('stats/${attendee.email}');
              },
            ),
          ),
        ],
      ),
    );
  }
}