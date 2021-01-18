import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/ui/components/registry/master_buttons.dart';
import 'package:checkin/src/ui/components/registry/registry_button.dart';
import 'package:checkin/src/ui/components/registry/student_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checkin/src/localization/localization.dart';

class RegistryControls extends StatelessWidget {
  static const String classClosed = 'Class closed';

  const RegistryControls({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistryBloc, RegistryState>(
        buildWhen: (RegistryState previous, RegistryState current) => !(current is RegistryLoading),
        builder: (BuildContext context, RegistryState state) => state.maybeMap(
            registryLoaded: (RegistryLoaded state) {
              if (state.isClosedRegistry) {
                return RegistryButton(
                  key: Key('registryClosed'),
                  text: classClosed.i18n,
                  onPressed: DISABLED_BUTTON,
                );
              }
              return state.currentUser.isOwner
                  ? MasterButtons(registryState: state)
                  : StudentButtons(registryState: state);
            },
            orElse: () => RegistryButton(
                  isLoading: true,
                  onPressed: DISABLED_BUTTON,
                )));
  }
}
