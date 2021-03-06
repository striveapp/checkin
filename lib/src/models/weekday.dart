import 'package:collection/collection.dart' show IterableExtension;

enum Weekday {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

extension WeekdayExtension on Weekday? {
  static final names = {
    Weekday.monday: 'monday',
    Weekday.tuesday: 'tuesday',
    Weekday.wednesday: 'wednesday',
    Weekday.thursday: 'thursday',
    Weekday.friday: 'friday',
    Weekday.saturday: 'saturday',
    Weekday.sunday: 'sunday',
  };

  String? get name => names[this!];
}

extension WeekdayParser on String {
  Weekday? toWeekday() => Weekday.values
      .firstWhereOrNull((element) => element.name!.toLowerCase() == this.toLowerCase());
}
