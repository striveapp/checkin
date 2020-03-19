import 'package:checkin/src/blocs/user_stats/bloc.dart';
import 'package:checkin/src/blocs/user_stats/user_stats_bloc.dart';
import 'package:flutter/material.dart';
import 'package:checkin/src/constants.dart' as constants;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checkin/src/localization/localization.dart';

String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

class TimespanToggles extends StatefulWidget {
  @override
  _TimespanTogglesState createState() => _TimespanTogglesState();
}

class _TimespanTogglesState extends State<TimespanToggles> {
  static final List<String> timeSpans = <String>[
    constants.WEEK,
    constants.MONTH,
    constants.YEAR
  ];

  List<bool> _selections = timeSpans.map((String value) => value == constants.WEEK,).toList();

  @override
  Widget build(BuildContext context) {
    List<Widget> _elements = timeSpans.map((String value) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(_capitalize(value.i18n), style: Theme.of(context).textTheme.bodyText1.apply(color: Colors.black),),
    ),).toList();

    return ToggleButtons(
      children: _elements,
      isSelected: _selections,
      onPressed: (int index) {
        BlocProvider.of<UserStatsBloc>(context)
            .add(LoadStats(timeSpan: timeSpans[index]));

        _updateSelected(index);
      },
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
