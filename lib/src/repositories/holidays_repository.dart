import 'package:checkin/src/resources/holidays_provider.dart';

class HolidaysRepository {
  final _holidaysProvider = HolidaysProvider();

  Map<DateTime, List> getHolidays() => _holidaysProvider.getHolidays();
}
