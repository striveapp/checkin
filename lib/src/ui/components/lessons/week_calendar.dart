import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/blocs/lessons/lessons_bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/holidays_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class WeekCalendar extends StatefulWidget {
  @override
  _WeekCalendarState createState() => _WeekCalendarState();
  final HolidaysRepository holidaysRepository;
  final User currentUser;

  const WeekCalendar({
    Key key,
    @required this.holidaysRepository,
    @required this.currentUser,
  }) : super(key: key);
}

class _WeekCalendarState extends State<WeekCalendar> {
  CalendarController _calendarController;

  _WeekCalendarState() {
    _calendarController = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    var selectedGymId = widget.currentUser.selectedGymId;

    if (selectedGymId == 'test') {
      return TableCalendar(
        calendarController: _calendarController,
        locale: Localizations.localeOf(context).toLanguageTag(),
        headerVisible: true,
        headerStyle: HeaderStyle(
            rightChevronVisible: false,
            leftChevronVisible: false,
            formatButtonVisible: false,
            headerPadding: EdgeInsets.only(bottom: 10, left: 20),
            titleTextStyle: Theme.of(context).textTheme.headline3),
        initialSelectedDay: DateUtil().getInitialSelectedDayByGym(selectedGymId),
        initialCalendarFormat: CalendarFormat.week,
        startingDayOfWeek: StartingDayOfWeek.monday,
        availableGestures: AvailableGestures.none,
        onDaySelected: (DateTime selectedDay, List<dynamic> event, List<dynamic> holidays) {
          context.read<LessonsBloc>().add(LoadLessons(selectedDay: selectedDay));
        },
        holidays: widget.holidaysRepository.getHolidays(),
        calendarStyle: CalendarStyle(
            selectedColor: Theme.of(context).accentColor,
            todayColor: Theme.of(context).accentColor.withAlpha(100)),
      );
    }

    return TableCalendar(
      calendarController: _calendarController,
      locale: Localizations.localeOf(context).toLanguageTag(),
      headerVisible: false,
      initialSelectedDay: DateUtil().getInitialSelectedDayByGym(selectedGymId),
      initialCalendarFormat: CalendarFormat.twoWeeks,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableGestures: AvailableGestures.none,
      onDaySelected: (DateTime selectedDay, List<dynamic> event, List<dynamic> holidays) {
        context.read<LessonsBloc>().add(LoadLessons(selectedDay: selectedDay));
      },
      holidays: widget.holidaysRepository.getHolidays(),
      calendarStyle: CalendarStyle(
          selectedColor: Theme.of(context).accentColor,
          todayColor: Theme.of(context).accentColor.withAlpha(100)),
    );
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }
}
