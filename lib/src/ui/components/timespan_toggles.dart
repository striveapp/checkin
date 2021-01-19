import 'package:checkin/src/blocs/stats/bloc.dart';
import 'package:checkin/src/constants.dart' as constants;
import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

class TimespanToggles extends StatefulWidget {
  @override
  _TimespanTogglesState createState() => _TimespanTogglesState();
}

class _TimespanTogglesState extends State<TimespanToggles> {
  List<bool> _selections = StatsBloc.timespans
      .map(
        (String value) => value == constants.WEEK,
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    List<Widget> _elements = StatsBloc.timespans
        .map(
          (String value) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(_capitalize(value.i18n),
                style: Theme.of(context).textTheme.bodyText1, key: Key("timespan_$value")),
          ),
        )
        .toList();

    return ToggleButtons(
      children: _elements,
      isSelected: _selections,
      onPressed: (int index) {
        BlocProvider.of<StatsBloc>(context)
            .add(TimespanUpdate(timespan: StatsBloc.timespans[index]));

        _updateSelected(index);
      },
      fillColor: Theme.of(context).accentColor.withAlpha(60),
      borderRadius: BorderRadius.circular(7),
    );
  }

  void _updateSelected(int selectedIndex) {
    //TODO: this logic can be simplified
    final List<bool> newSelections = _selections.map((x) => false).toList();
    newSelections[selectedIndex] = true;

    setState(() {
      _selections = newSelections;
    });
  }
}
