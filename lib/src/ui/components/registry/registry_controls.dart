import 'package:checkin/src/blocs/lesson/registry/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/ui/components/registry/registry_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistryControls extends StatelessWidget {
  final VoidCallback disabledButton = null;

  static const String unregisterClass = 'Unregister from class';
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

        VoidCallback onPressUnregisterClass = () {
          BlocProvider.of<RegistryBloc>(context).add(Unregister(
            attendee: Attendee.fromUser(currentUser),
          ));
        };

        VoidCallback onPressRegisterClass = () {
          BlocProvider.of<RegistryBloc>(context).add(Register(
            attendee: Attendee.fromUser(currentUser),
          ));
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
        
        if(state.isFullRegistry()) {
          return RegistryButton(
            key: Key('registryFull'),
            text: RegistryControls.registryFull.i18n,
            onPressed: disabledButton,
          );
        }

        if (state.isAcceptedUser(currentUser.email)) {
          return RegistryButton(
            key: Key('acceptedInClass'),
            text: RegistryControls.registerClass.i18n,
            onPressed: disabledButton,
          );
        }

        if (state.isRegisteredUser(currentUser.email)) {
          return RegistryButton(
            key: Key('unregisterClass'),
            text: RegistryControls.unregisterClass.i18n,
            color: Theme.of(context).buttonTheme.colorScheme.error,
            onPressed: onPressUnregisterClass,
          );
        }

        return RegistryButton(
          key: Key('registerClass'),
          text: RegistryControls.registerClass.i18n,
          onPressed: onPressRegisterClass,
        );
      }
      return ErrorWidget('unknown state [$state] in registry_controls');
    });
  }
}
