import 'package:flutter/material.dart';

class DateTimeField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final DateTime? initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final ValueChanged<DateTime> onFieldSubmitted;
  final GlobalKey<FormFieldState> textFieldKey;

  const DateTimeField({
    required Key key,
    this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onFieldSubmitted,
    required this.labelText,
    required this.hintText,
    required this.textFieldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? formattedDate = initialDate == null
        ? null
        : MaterialLocalizations.of(context).formatCompactDate(initialDate!);
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
          key: textFieldKey,
          keyboardType: TextInputType.datetime,
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
          controller: formattedDate == null
              ? null
              : TextEditingController.fromValue(
                  TextEditingValue(
                      text: formattedDate,
                      selection: new TextSelection.collapsed(offset: formattedDate.length)),
                ),
          onTap: () async {
            FocusScope.of(context).requestFocus(FocusNode());
            final DateTime? picked = await showDatePicker(
                context: context,
                firstDate: DateTime.now().subtract(Duration(days: 100 * 365)),
                initialDate: DateTime.now(),
                lastDate: DateTime.now());

            if (picked != null && picked != initialDate) {
              onFieldSubmitted(picked);
            }
          },
        ),
      ],
    );
  }
}
