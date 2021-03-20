enum Weekday {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

extension WeekdayExtension on Weekday {
  static final names = {
    Weekday.monday: 'Monday',
    Weekday.tuesday: 'Tuesday',
    Weekday.wednesday: 'Wednesday',
    Weekday.thursday: 'Thursday',
    Weekday.friday: 'Friday',
    Weekday.saturday: 'Saturday',
    Weekday.sunday: 'Sunday',
  };

  String get name => names[this];
}

extension WeekdayParser on String {
  Weekday toWeekday() =>
      Weekday.values.firstWhere((element) => element.name.toLowerCase() == this?.toLowerCase(),
          orElse: () => null);
}
