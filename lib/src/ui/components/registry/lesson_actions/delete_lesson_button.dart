// @dart=2.9

import 'package:checkin/src/ui/components/registry/delete_lesson_dialog.dart';
import 'package:flutter/material.dart';

class DeleteLessonButton extends StatelessWidget {
  final String selectedGymId;

  const DeleteLessonButton({
    Key key,
    @required this.selectedGymId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: Key('deleteClassButton'),
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
          builder: (_) => DeleteLessonDialog(
            selectedGymId: selectedGymId,
          ).build(context),
        );
      },
      child: Icon(
        Icons.delete,
        color: Colors.white,
        size: 22,
      ),
    );
  }
}
