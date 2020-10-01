import 'package:checkin/src/api/http_client.dart';
import 'package:checkin/src/api/membership_api.dart';
import 'package:checkin/src/blocs/lesson/registry/bloc.dart';
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
import 'package:checkin/src/ui/components/registry/register_dialog.dart';
import 'package:checkin/src/ui/components/registry/registry_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checkin/src/constants.dart' as constants;

import '../loading_indicator.dart';

class RegistryControls extends StatelessWidget {
  final VoidCallback disabledButton = null;

  static const String unregisterClass = 'Cancel class';
  static const String registerClass = 'Register to class';
  static const String registryFull = 'Class full';
  static const String acceptAll = 'Accept all';

  const RegistryControls({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistryBloc, RegistryState>(
        builder: (BuildContext context, RegistryState state) {
      if (state is RegistryUninitialized || state is RegistryLoading) {
        return RegistryButton(
          isLoading: true,
          onPressed: disabledButton,
        );
      }

      if (state is RegistryLoaded) {
        var currentUser = state.currentUser;

        Function(Attendee) unregisterFromClass = (Attendee registeredUser) {
          BlocProvider.of<RegistryBloc>(context).add(Unregister(
            attendee: registeredUser,
          ));
        };

        VoidCallback onPressRegisterClass = () {
          BlocProvider.of<RegistryBloc>(context).add(Register(
            attendee: Attendee.fromUser(currentUser),
          ));
        };

        VoidCallback onPressRegisterClass2 = () {
          showDialog(
            context: context,
            builder: (_) => RegisterDialog(currentUser: state.currentUser).build(context),
          );
        };

        VoidCallback onPressAcceptAll = () {
          BlocProvider.of<RegistryBloc>(context).add(AcceptAttendees());
        };

        if (currentUser.isOwner) {
          return RegistryButton(
            key: Key('acceptAll'),
            onPressed:
                state.attendees.length > 0 ? onPressAcceptAll : disabledButton,
            text: RegistryControls.acceptAll.i18n,
          );
        }

        if (state.isAcceptedUser(currentUser.email)) {
          return RegistryButton(
            key: Key('acceptedInClass'),
            text: RegistryControls.registerClass.i18n,
            onPressed: disabledButton,
          );
        }

        Attendee registeredUser = state.getRegisteredUser(currentUser.email);
        if (registeredUser != null) {
          return RegistryButton(
            key: Key('unregisterClass'),
            text: RegistryControls.unregisterClass.i18n,
            color: Theme.of(context).buttonTheme.colorScheme.error,
            onPressed: () => unregisterFromClass(registeredUser),
          );
        }

        if (state.isFullRegistry()) {
          return RegistryButton(
            key: Key('registryFull'),
            text: RegistryControls.registryFull.i18n,
            onPressed: disabledButton,
          );
        }

        return MultiBlocProvider(
          providers: [
            BlocProvider<UserStatsBloc>(
              create: (BuildContext context) => UserStatsBloc(
                statsRepository:
                    RepositoryProvider.of<StatsRepository>(context),
                userEmail: state.currentUser.email,
                selectedGymId: state.currentUser.selectedGymId,
                statsBloc: StatsBloc()
                  ..add(TimespanUpdate(timespan: constants.MONTH)),
              ),
            ),
            BlocProvider<MembershipBloc>(
              create: (BuildContext context) => MembershipBloc(
                analyticsRepository:
                    RepositoryProvider.of<AnalyticsRepository>(context),
                membershipApi: MembershipApi(
                    httpClient: HttpClient(authRepository: AuthProvider())),
                membershipRepository: MembershipProvider(),
                userEmail: state.currentUser.email,
                selectedGymId: state.currentUser.selectedGymId,
              ),
            )
          ],
          child: BlocBuilder<MembershipBloc, MembershipState>(
              builder: (BuildContext context, MembershipState state) {
            return state.maybeWhen(
                membershipLoading: () => LoadingIndicator(),
                membershipActive: (Membership membership) =>
                    BlocBuilder<UserStatsBloc, UserStatsState>(
                      builder: (BuildContext context, UserStatsState state) {
                        if (state is UserStatsLoaded) {
                          if (state.attendedLessons.length >=
                              membership.totalLessonsOfPlan) {
                            return RegistryButton(
                              key: Key('registerClass'),
                              text: RegistryControls.registerClass.i18n,
                              onPressed: () => onPressRegisterClass2(),
                            );
                          }
                        }

                        return RegistryButton(
                          key: Key('registerClass'),
                          text: RegistryControls.registerClass.i18n,
                          onPressed: onPressRegisterClass,
                        );
                      },
                    ),
                orElse: () => RegistryButton(
                      key: Key('registerClass'),
                      text: RegistryControls.registerClass.i18n,
                      onPressed: onPressRegisterClass,
                    ));
          }),
        );
      }
      return ErrorWidget('unknown state [$state] in registry_controls');
    });
  }
}
