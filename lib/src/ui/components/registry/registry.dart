import 'package:checkin/src/ui/components/registry/registry_controls.dart';
import 'package:flutter/material.dart';

import 'attendees_list.dart';
import 'registry_counter.dart';

class Registry extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: RegistryCounter(),
        ),
        SizedBox(
          height: 10,
        ),
        AttendeesList(),
        SizedBox(
          height: 20,
        ),
        RegistryControls()
      ],
    );
  }
}
