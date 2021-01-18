import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/ui/components/registry/registry_controls.dart';
import 'package:checkin/src/ui/components/registry/registry_missing_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'attendees_list.dart';
import 'registry_counter.dart';

class Registry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistryBloc, RegistryState>(
      listener: (BuildContext context, RegistryState state) {
        if (state is RegistryMissing) {
          showDialog(
            context: context,
            builder: (_) => RegistryMissingDialog().build(context),
          );
        }
      },
      child: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: RegistryCounter(),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(child: AttendeesList()),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          RegistryControls()
        ],
      ),
    );
  }
}
