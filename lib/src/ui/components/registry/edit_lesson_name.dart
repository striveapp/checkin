import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditLessonName extends StatefulWidget {
  static const String name = "Name";

  final String lessonName;
  final String gymId;

  const EditLessonName({
    Key key,
    this.lessonName,
    this.gymId,
  }) : super(key: key);

  @override
  _EditLessonNameState createState() => _EditLessonNameState();
}

class _EditLessonNameState extends State<EditLessonName> {
  String currentName;

  @override
  void initState() {
    super.initState();
    currentName = widget.lessonName;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          EditLessonName.name.i18n,
          style: Theme.of(context).textTheme.headline3,
        ),
        Expanded(
          child: TextField(
            textAlign: TextAlign.end,
            controller: _getController(currentName),
            keyboardType: TextInputType.name,
            cursorColor: Theme.of(context).accentColor,
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
              errorStyle:
                  Theme.of(context).textTheme.bodyText1.apply(color: Theme.of(context).errorColor),
            ),
            onSubmitted: (String newName) {
              context
                  .read<RegistryBloc>()
                  .add(RegistryEvent.updateName(gymId: widget.gymId, newName: newName));
              setState(() {
                currentName = newName;
              });
            },
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.edit,
          size: 18,
        )
      ],
    );
  }

  TextEditingController _getController(String initialValue) {
    var controller = TextEditingController();
    controller.text = initialValue;
    controller.selection = TextSelection.fromPosition(
      TextPosition(
        offset: initialValue.length,
      ),
    );
    return controller;
  }
}
