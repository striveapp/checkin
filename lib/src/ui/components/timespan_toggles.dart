import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:flutter/material.dart';

String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

class TimespanToggles extends StatefulWidget {
  final List<Timespan> availableTimespans;
  final Timespan defaultTimespan;
  final Function(int) onPressed;

  const TimespanToggles({
    Key key,
    @required this.availableTimespans,
    @required this.defaultTimespan,
    @required this.onPressed,
  }) : super(key: key);

  @override
  _TimespanTogglesState createState() => _TimespanTogglesState();
}

class _TimespanTogglesState extends State<TimespanToggles> {
  List<bool> _selections;

  @override
  void initState() {
    super.initState();
    _selections =
        widget.availableTimespans.map((Timespan value) => value == widget.defaultTimespan).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: widget.availableTimespans
          .map((Timespan timespan) => ToggleChip(
                name: timespan.name,
              ))
          .toList(),
      isSelected: _selections,
      onPressed: (int index) {
        widget.onPressed(index);
        _updateSelected(index);
      },
      fillColor: Theme.of(context).colorScheme.secondary.withAlpha(60),
      borderRadius: BorderRadius.circular(7),
    );
  }

  void _updateSelected(int selectedIndex) {
    final List<bool> newSelections = _selections.map((x) => false).toList();
    newSelections[selectedIndex] = true;

    setState(() {
      _selections = newSelections;
    });
  }
}

class ToggleChip extends StatelessWidget {
  final String name;

  const ToggleChip({
    Key key,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        _capitalize(name.i18n),
        style: Theme.of(context).textTheme.bodyText1,
        key: Key("timespan_${name}"),
      ),
    );
  }
}
