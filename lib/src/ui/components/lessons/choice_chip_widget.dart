import 'package:flutter/material.dart';

//TODO lessonConfig: find better name for this
class ChoiceChipWidget extends StatelessWidget {
  final String text;
  final bool selected;
  final Function(bool) onSelected;

  const ChoiceChipWidget({
    Key key,
    this.text,
    this.selected,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ChoiceChip(
        selectedColor: Theme.of(context).accentColor,
        label: Container(
          constraints: BoxConstraints(
            minWidth: 40,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        selected: selected,
        onSelected: onSelected,
      ),
    );
  }
}
