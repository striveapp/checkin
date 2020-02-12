class HolidaysProvider {
  final Map<DateTime, List> _holidays = {
    DateTime(2020, 4, 10): ['Viernes Santo'],
    DateTime(2020, 4, 13): ['Lunes de Pasqua'],
    DateTime(2020, 5, 1): ['Primero de Mayo'],
    DateTime(2021, 1, 1): ['New Year\'s Day'],
  };

  Map<DateTime, List> getHolidays() {
    return _holidays;
  }
}