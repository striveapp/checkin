// @dart=2.9

enum Timespan {
  week,
  month,
  year,
  all,
}

extension TimespanExtension on Timespan {
  static final names = {
    Timespan.week: 'week',
    Timespan.month: 'month',
    Timespan.year: 'year',
    Timespan.all: 'all',
  };

  String get name => names[this];
}
