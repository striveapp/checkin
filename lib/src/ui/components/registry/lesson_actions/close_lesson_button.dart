// @dart=2.9

import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/ui/components/registry/close_lesson_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CloseLessonButton extends StatelessWidget {
  final String selectedGymId;

  const CloseLessonButton({
    Key key,
    @required this.selectedGymId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistryBloc, RegistryState>(
        builder: (BuildContext context, RegistryState state) {
      return ElevatedButton(
        key: Key('closeClassButton'),
        style: ElevatedButton.styleFrom(
          elevation: 2.0,
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
          primary: Theme.of(context).colorScheme.error,
          minimumSize: Size(40, 40),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => CloseLessonDialog(
              selectedGymId: selectedGymId,
            ).build(context),
          );
        },
        child: Icon(
          Icons.close,
          color: Colors.white,
          size: 22,
        ),
      );
    });
  }
}
