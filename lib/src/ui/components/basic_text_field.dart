import 'package:flutter/material.dart';

class BasicTextField extends StatelessWidget {
  final String labelText;
  final String? textValue;
  final String hintText;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;
  final TextInputType keyboardType;

  const BasicTextField({
    required Key key,
    required this.labelText,
    this.textValue,
    required this.validator,
    required this.onFieldSubmitted,
    required this.keyboardType,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          child: Text(
            labelText,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .apply(color: Theme.of(context).textTheme.bodyText1!.color!.withAlpha(110)),
          ),
          alignment: Alignment.centerLeft,
        ),
        TextFormField(
          key: key,
          keyboardType: keyboardType,
          cursorColor: Theme.of(context).colorScheme.secondary,
          style: Theme.of(context).textTheme.headline3!.apply(fontWeightDelta: 2),
          decoration: new InputDecoration(
            errorBorder: InputBorder.none,
            errorMaxLines: 2,
            errorStyle: Theme.of(context)
                .textTheme
                .bodyText1!
                .apply(color: Theme.of(context).colorScheme.error),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.headline4,
            disabledBorder: InputBorder.none,
          ),
          controller: textValue == null
              ? null
              : TextEditingController.fromValue(
                  TextEditingValue(
                      text: textValue!,
                      selection: new TextSelection.collapsed(offset: textValue!.length)),
                ),
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
