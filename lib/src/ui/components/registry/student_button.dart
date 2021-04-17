import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/blocs/sessions/bloc.dart';
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/repositories/membership_repository.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/registry/register_dialog.dart';
import 'package:checkin/src/ui/components/registry/registry_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentButtons extends StatelessWidget {
  final RegistryLoaded registryState;
  static const String unregisterClass = 'Cancel class';
  static const String registerClass = 'Register to class';
  static const String registryFull = 'Class full';

  StudentButtons({@required this.registryState});

  @override
  Widget build(BuildContext context) {
    VoidCallback onPressUnregisterClass = () {
      var attendee = registryState.currentLesson.attendees
          .where((attendee) => attendee.email == registryState.currentUser.email)
          .first;

      BlocProvider.of<RegistryBloc>(context).add(Unregister(
        gymId: registryState.currentUser.selectedGymId,
        attendee: attendee,
      ));
    };

    VoidCallback onPressRegisterClass = () {
      BlocProvider.of<RegistryBloc>(context).add(Register(
        gymId: registryState.currentUser.selectedGymId,
        attendee: Attendee.fromUser(registryState.currentUser),
      ));
    };

    VoidCallback showRegisterDialogOnPressRegisterClass = () {
      showDialog(
        context: context,
        builder: (_) => RegisterDialog(currentUser: registryState.currentUser).build(context),
      );
    };

    if (registryState.isAcceptedUser) {
      return RegistryButton(
        key: Key('acceptedInClass'),
        text: registerClass.i18n,
        onPressed: DISABLED_BUTTON,
      );
    }

    if (registryState.isRegisteredUser) {
      return RegistryButton(
        key: Key('unregisterClass'),
        text: unregisterClass.i18n,
        color: Theme.of(context).buttonTheme.colorScheme.error,
        onPressed: onPressUnregisterClass,
      );
    }

    if (registryState.isFullRegistry) {
      return RegistryButton(
        key: Key('registryFull'),
        text: registryFull.i18n,
        onPressed: DISABLED_BUTTON,
      );
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider<SessionsBloc>(
          create: (BuildContext context) => SessionsBloc(
            statsRepository: RepositoryProvider.of<StatsRepository>(context),
            userEmail: registryState.currentUser.email,
            selectedGymId: registryState.currentUser.selectedGymId,
            membershipRepository: RepositoryProvider.of<MembershipRepository>(context),
          ),
        )
      ],
      child: BlocBuilder<SessionsBloc, SessionsState>(
          builder: (BuildContext context, SessionsState registryState) {
        return registryState.maybeWhen(
            initialSessionsState: () => LoadingIndicator(),
            sessionsWarning: (_totalLessonsOfPlan, _attendedLessons) => RegistryButton(
                  key: Key('registerClass'),
                  text: registerClass.i18n,
                  onPressed: () => showRegisterDialogOnPressRegisterClass(),
                ),
            orElse: () => RegistryButton(
                  key: Key('registerClass'),
                  text: registerClass.i18n,
                  onPressed: onPressRegisterClass,
                ));
      }),
    );
  }
}
