import 'package:flutter/material.dart';

class EditLessonName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Name",
          style: Theme.of(context).textTheme.headline3,
        ),
        Expanded(
          child: TextField(
            textAlign: TextAlign.end,
            controller: _getController(),
            keyboardType: TextInputType.name,
            cursorColor: Theme.of(context).accentColor,
            style: Theme.of(context).textTheme.headline2.apply(fontSizeDelta: 3),
            decoration: new InputDecoration(
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
            // onFieldSubmitted: (String value) {
            //   if (_formKey.currentState.validate()) {
            //     Logger.log.i("MA CHE OHH!");
            //     // UserBloc userBloc = context.read<UserBloc>();
            //     // userBloc.add(UpdateName(newName: value.trim()));
            //   }
            // },
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(Icons.edit)
      ],
    );
  }

  TextEditingController _getController() {
    var controller = TextEditingController();
    controller.text = "porco";
    controller.clearComposing();
    controller.selection = TextSelection.fromPosition(
      TextPosition(
        offset: controller.text.length,
      ),
    );
    return controller;
  }
}
