// @dart=2.9

import 'package:checkin/src/blocs/edit_lesson/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/logging/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditLessonCapacity extends StatefulWidget {
  static const String capacity = "Capacity";
  final String gymId;
  final int classCapacity;

  const EditLessonCapacity({
    Key key,
    this.gymId,
    this.classCapacity,
  }) : super(key: key);

  @override
  _EditLessonCapacityState createState() => _EditLessonCapacityState();
}

class _EditLessonCapacityState extends State<EditLessonCapacity> {
  int currentCapacity;

  @override
  void initState() {
    super.initState();
    currentCapacity = widget.classCapacity;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          EditLessonCapacity.capacity.i18n,
          style: Theme.of(context).textTheme.headline3,
        ),
        Expanded(
          child: TextField(
            textAlign: TextAlign.end,
            controller: _getController(currentCapacity),
            keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
            cursorColor: Theme.of(context).colorScheme.secondary,
            style: Theme.of(context).textTheme.headline2.apply(fontSizeDelta: 3),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              isDense: true,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorMaxLines: 1,
              errorStyle: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .apply(color: Theme.of(context).colorScheme.error),
            ),
            onSubmitted: (String newCapacityString) {
              try {
                var newCapacity = int.parse(newCapacityString);
                context
                    .read<EditLessonBloc>()
                    .add(EditLessonEvent.updateCapacity(newCapacity: newCapacity));
                setState(() {
                  currentCapacity = newCapacity;
                });
              } catch (e, st) {
                Logger.log.e("Capacity is not parsable", e, st);
              }
            },
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.add,
          size: 18,
        )
      ],
    );
  }

  TextEditingController _getController(int initialValue) {
    var controller = TextEditingController();
    controller.text = initialValue.toString();
    controller.selection = TextSelection.fromPosition(
      TextPosition(
        offset: controller.text.length,
      ),
    );
    return controller;
  }
}
