import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/registry/accept_all_dialog.dart';
import 'package:checkin/src/ui/components/registry/registry_button.dart';
import 'package:checkin/src/ui/components/registry/student_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistryControls extends StatelessWidget {
  static const String acceptAll = 'Accept all';

  const RegistryControls({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistryBloc, RegistryState>(
        buildWhen: (RegistryState previous, RegistryState current) => !(current is RegistryLoading),
        builder: (BuildContext context, RegistryState state) {
          return state.maybeMap(
              registryLoaded: (RegistryLoaded state) {
                var currentUser = state.currentUser;

                VoidCallback showConfirmDialogOnPressAcceptAll = () {
                  showDialog(
                    context: context,
                    builder: (_) => AcceptAllDialog(currentUser: state.currentUser).build(context),
                  );
                };

                if (currentUser.isOwner) {
                  return Column(
                    children: [
                      if (!state.isMasterOfTheClass)
                        Column(
                          children: [
                            StudentButton(registryState: state),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      RegistryButton(
                        key: Key('acceptAll'),
                        onPressed: state.currentLesson.attendees.length > 0
                            ? showConfirmDialogOnPressAcceptAll
                            : DISABLED_BUTTON,
                        text: RegistryControls.acceptAll.i18n,
                      ),
                    ],
                  );
                }

                return StudentButton(registryState: state);
              },
              orElse: () => RegistryButton(
                    isLoading: true,
                    onPressed: DISABLED_BUTTON,
                  ));
        });
  }
}
