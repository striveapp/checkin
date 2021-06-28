// @dart=2.9

import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/ui/components/registry/accept_all_dialog.dart';
import 'package:checkin/src/ui/components/registry/registry_button.dart';
import 'package:checkin/src/ui/components/registry/student_button.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class MasterButtons extends StatelessWidget {
  static const String acceptAll = 'Accept all';
  static const String closeClass = 'Close class';

  final RegistryLoaded registryState;

  const MasterButtons({Key key, this.registryState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VoidCallback showConfirmDialogOnPressAcceptAll = () {
      showDialog(
        context: context,
        builder: (_) => AcceptAllDialog(
          selectedGymId: registryState.currentUser.selectedGymId,
        ).build(context),
      );
    };

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!registryState.isMasterOfTheClass)
          Column(
            children: [
              StudentButtons(registryState: registryState),
              SizedBox(
                height: 10,
              )
            ],
          ),
        RegistryButton(
          key: Key('acceptAll'),
          text: acceptAll.i18n,
          onPressed: registryState.currentLesson.attendees.length > 0
              ? showConfirmDialogOnPressAcceptAll
              : DISABLED_BUTTON,
        ),
      ],
    );
  }
}
