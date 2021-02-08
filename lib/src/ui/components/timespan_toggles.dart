import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/timespan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

class TimespanToggles extends StatefulWidget {
  @override
  _TimespanTogglesState createState() => _TimespanTogglesState();
}

class _TimespanTogglesState extends State<TimespanToggles> {
  List<bool> _selections = StatsBloc.availableTimespans
      .map(
        (Timespan value) => value == Timespan.week,
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    List<Widget> _elements = StatsBloc.availableTimespans
        .map(
          (Timespan timespan) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(_capitalize(timespan.name.i18n),
                style: Theme.of(context).textTheme.bodyText1,
                key: Key("timespan_${timespan.name}")),
          ),
        )
        .toList();

    return ToggleButtons(
      children: _elements,
      isSelected: _selections,
      onPressed: (int index) {
        BlocProvider.of<StatsBloc>(context)
            .add(TimespanUpdate(timespan: StatsBloc.availableTimespans[index]));

        _updateSelected(index);
      },
      fillColor: Theme.of(context).accentColor.withAlpha(60),
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
