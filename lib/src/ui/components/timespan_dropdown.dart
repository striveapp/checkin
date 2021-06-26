import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:flutter/material.dart';

String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

class TimespanDropdown extends StatefulWidget {
  final List<Timespan> availableTimespans;
  final Timespan defaultTimespan;
  final Function(Timespan) onChanged;

  const TimespanDropdown({
    Key key,
    @required this.availableTimespans,
    @required this.defaultTimespan,
    @required this.onChanged,
  }) : super(key: key);

  @override
  _TimespanDropdownState createState() => _TimespanDropdownState();
}

class _TimespanDropdownState extends State<TimespanDropdown> {
  Timespan _chosenTimespan;

  @override
  void initState() {
    super.initState();
    _chosenTimespan = widget.defaultTimespan;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background.withAlpha(100),
          borderRadius: BorderRadius.circular(8)),
      child: DropdownButton(
          icon: Icon(Icons.keyboard_arrow_down_rounded),
          underline: EmptyWidget(),
          style: Theme.of(context).textTheme.headline5,
          value: _chosenTimespan,
          items: widget.availableTimespans
              .map((Timespan timespan) => DropdownMenuItem(
                    value: timespan,
                    child: Text(_capitalize(timespan.name)),
                  ))
              .toList(),
          onChanged: (Timespan selectedTimespan) {
            widget.onChanged(selectedTimespan);
            setState(() {
              _chosenTimespan = selectedTimespan;
            });
          }),
    );
  }
}

class DropdownChip extends StatelessWidget {
  final String name;

  const DropdownChip({
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
