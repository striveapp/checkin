import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/registry_button.dart';
import 'package:flutter/material.dart';

class RegistryControls extends StatelessWidget {
  final bool isOwner;
  final bool isUserInClass;
  final VoidCallback onPressedAcceptAll;
  final VoidCallback onPressRegisterClass;
  final VoidCallback onPressUnregisterClass;

  const RegistryControls({
    Key key,
    @required this.isOwner,
    @required this.isUserInClass,
    @required this.onPressedAcceptAll,
    @required this.onPressRegisterClass,
    @required this.onPressUnregisterClass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return this.isOwner ?
      RegistryButton(
            key: Key('acceptAll'),
            onPressed: onPressedAcceptAll,
            text: Localization.of(context).acceptAll,
          )
        : (
        this.isUserInClass ?
          RegistryButton(
            text: Localization.of(context).unregisterClass,
            color: Color(0xFFEF5350),
            onPressed: this.onPressUnregisterClass,
          ) :
          RegistryButton(
            text: Localization.of(context).registerClass,
            onPressed: this.onPressRegisterClass,
          )
      );
  }
}
