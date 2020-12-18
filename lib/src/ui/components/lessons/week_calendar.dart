import 'package:checkin/src/repositories/holidays_repository.dart';
import 'package:checkin/src/util/debug_util.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:checkin/src/constants.dart';

class WeekCalendar extends StatefulWidget {
  @override
  _WeekCalendarState createState() => _WeekCalendarState();
  final HolidaysRepository holidaysRepository;
  final Function(DateTime, List<dynamic>, List<dynamic>) onDaySelected;

  const WeekCalendar({
    Key key,
    @required this.holidaysRepository,
    @required this.onDaySelected,
  }) : super(key: key);
}

class _WeekCalendarState extends State<WeekCalendar> {
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarController: _calendarController,
      locale: Localizations.localeOf(context).toLanguageTag(),
      headerVisible: false,
      initialSelectedDay: isInDebugMode ? testDate : DateTime.now(), //NOTE: this is used for the e2e tests
      initialCalendarFormat: CalendarFormat.twoWeeks,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableGestures: AvailableGestures.none,
      onDaySelected: widget.onDaySelected,
      holidays: widget.holidaysRepository.getHolidays(),
      calendarStyle: CalendarStyle(
        selectedColor: Theme.of(context).accentColor,
        todayColor: Theme.of(context).accentColor.withAlpha(100)
      ),
    );
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }
}
