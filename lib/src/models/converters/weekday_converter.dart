import 'package:checkin/src/models/weekday.dart';
import 'package:json_annotation/json_annotation.dart';

class WeekdayConverter implements JsonConverter<Weekday?, String?> {
  const WeekdayConverter();

  @override
  Weekday? fromJson(String? json) => json?.toWeekday();

  @override
  String? toJson(Weekday? weekday) => weekday?.name;
}
