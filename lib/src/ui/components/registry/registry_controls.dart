import 'package:checkin/src/blocs/lesson/registry/bloc.dart';
import 'package:checkin/src/blocs/sessions/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/membership_repository.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/ui/components/registry/register_dialog.dart';
import 'package:checkin/src/ui/components/registry/registry_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

        VoidCallback onPressAcceptAll = () {
          BlocProvider.of<RegistryBloc>(context).add(AcceptAttendees(gymId: currentUser.selectedGymId));
        };

        if (currentUser.isOwner) {
          return Column(
            children: [
              RegistryButton(
                key: Key('acceptAll'),
                onPressed:
                    state.attendees.length > 0 ? onPressAcceptAll : disabledButton,
                text: RegistryControls.acceptAll.i18n,
              ),
              Container(height: 20,),
              studentButton(currentUser, context),
            ],
          );
        }

        return studentButton(currentUser, context);
      }
      return ErrorWidget('unknown state [$state] in registry_controls');
    });
  }

  StatelessWidget studentButton(User currentUser, BuildContext context) {
    Function(Attendee) unregisterFromClass = (Attendee registeredUser) {
      BlocProvider.of<RegistryBloc>(context).add(Unregister(
        gymId: currentUser.selectedGymId,
        attendee: registeredUser,
      ));
    };

    VoidCallback onPressRegisterClass = () {
      BlocProvider.of<RegistryBloc>(context).add(Register(
        gymId: currentUser.selectedGymId,
        attendee: Attendee.fromUser(currentUser),
      ));
    };

    VoidCallback showRegisterDialogOnPressRegisterClass = () {
      showDialog(
        context: context,
        builder: (_) =>
            RegisterDialog(currentUser: currentUser).build(context),
      );
    };

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
        BlocProvider<SessionsBloc>(
          create: (BuildContext context) => SessionsBloc(
            statsRepository:
                RepositoryProvider.of<StatsRepository>(context),
            userEmail: currentUser.email,
            selectedGymId: currentUser.selectedGymId,
            membershipRepository:
                RepositoryProvider.of<MembershipRepository>(context),
          ),
        )
      ],
      child: BlocBuilder<SessionsBloc, SessionsState>(
          builder: (BuildContext context, SessionsState state) {
        return state.maybeWhen(
            initialSessionsState: () => LoadingIndicator(),
            sessionsWarning: (_totalLessonsOfPlan, _attendedLessons) =>
                RegistryButton(
                  key: Key('registerClass'),
                  text: RegistryControls.registerClass.i18n,
                  onPressed: () => showRegisterDialogOnPressRegisterClass(),
                ),
            orElse: () => RegistryButton(
                  key: Key('registerClass'),
                  text: RegistryControls.registerClass.i18n,
                  onPressed: onPressRegisterClass,
                ));
      }),
    );
  }
}
