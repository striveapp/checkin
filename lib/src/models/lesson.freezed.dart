// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'lesson.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Lesson _$LessonFromJson(Map<String, dynamic> json) {
  return _Lesson.fromJson(json);
}

/// @nodoc
class _$LessonTearOff {
  const _$LessonTearOff();

// ignore: unused_element
  _Lesson call(
      {String id,
      String date,
      String name,
      String timeStart,
      String timeEnd,
      String weekDay,
      int timestamp,
      int classCapacity = config.DEFAULT_CLASS_CAPACITY,
      List<Master> masters = const [],
      List<Attendee> attendees = const [],
      List<Attendee> acceptedAttendees = const []}) {
    return _Lesson(
      id: id,
      date: date,
      name: name,
      timeStart: timeStart,
      timeEnd: timeEnd,
      weekDay: weekDay,
      timestamp: timestamp,
      classCapacity: classCapacity,
      masters: masters,
      attendees: attendees,
      acceptedAttendees: acceptedAttendees,
    );
  }

// ignore: unused_element
  Lesson fromJson(Map<String, Object> json) {
    return Lesson.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Lesson = _$LessonTearOff();

/// @nodoc
mixin _$Lesson {
  String get id;
  String get date;
  String get name;
  String get timeStart;
  String get timeEnd;
  String get weekDay;
  int get timestamp;
  int get classCapacity;
  List<Master> get masters;
  List<Attendee> get attendees;
  List<Attendee> get acceptedAttendees;

  Map<String, dynamic> toJson();
  $LessonCopyWith<Lesson> get copyWith;
}

/// @nodoc
abstract class $LessonCopyWith<$Res> {
  factory $LessonCopyWith(Lesson value, $Res Function(Lesson) then) =
      _$LessonCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String date,
      String name,
      String timeStart,
      String timeEnd,
      String weekDay,
      int timestamp,
      int classCapacity,
      List<Master> masters,
      List<Attendee> attendees,
      List<Attendee> acceptedAttendees});
}

/// @nodoc
class _$LessonCopyWithImpl<$Res> implements $LessonCopyWith<$Res> {
  _$LessonCopyWithImpl(this._value, this._then);

  final Lesson _value;
  // ignore: unused_field
  final $Res Function(Lesson) _then;

  @override
  $Res call({
    Object id = freezed,
    Object date = freezed,
    Object name = freezed,
    Object timeStart = freezed,
    Object timeEnd = freezed,
    Object weekDay = freezed,
    Object timestamp = freezed,
    Object classCapacity = freezed,
    Object masters = freezed,
    Object attendees = freezed,
    Object acceptedAttendees = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      date: date == freezed ? _value.date : date as String,
      name: name == freezed ? _value.name : name as String,
      timeStart: timeStart == freezed ? _value.timeStart : timeStart as String,
      timeEnd: timeEnd == freezed ? _value.timeEnd : timeEnd as String,
      weekDay: weekDay == freezed ? _value.weekDay : weekDay as String,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as int,
      classCapacity: classCapacity == freezed
          ? _value.classCapacity
          : classCapacity as int,
      masters: masters == freezed ? _value.masters : masters as List<Master>,
      attendees:
          attendees == freezed ? _value.attendees : attendees as List<Attendee>,
      acceptedAttendees: acceptedAttendees == freezed
          ? _value.acceptedAttendees
          : acceptedAttendees as List<Attendee>,
    ));
  }
}

/// @nodoc
abstract class _$LessonCopyWith<$Res> implements $LessonCopyWith<$Res> {
  factory _$LessonCopyWith(_Lesson value, $Res Function(_Lesson) then) =
      __$LessonCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String date,
      String name,
      String timeStart,
      String timeEnd,
      String weekDay,
      int timestamp,
      int classCapacity,
      List<Master> masters,
      List<Attendee> attendees,
      List<Attendee> acceptedAttendees});
}

/// @nodoc
class __$LessonCopyWithImpl<$Res> extends _$LessonCopyWithImpl<$Res>
    implements _$LessonCopyWith<$Res> {
  __$LessonCopyWithImpl(_Lesson _value, $Res Function(_Lesson) _then)
      : super(_value, (v) => _then(v as _Lesson));

  @override
  _Lesson get _value => super._value as _Lesson;

  @override
  $Res call({
    Object id = freezed,
    Object date = freezed,
    Object name = freezed,
    Object timeStart = freezed,
    Object timeEnd = freezed,
    Object weekDay = freezed,
    Object timestamp = freezed,
    Object classCapacity = freezed,
    Object masters = freezed,
    Object attendees = freezed,
    Object acceptedAttendees = freezed,
  }) {
    return _then(_Lesson(
      id: id == freezed ? _value.id : id as String,
      date: date == freezed ? _value.date : date as String,
      name: name == freezed ? _value.name : name as String,
      timeStart: timeStart == freezed ? _value.timeStart : timeStart as String,
      timeEnd: timeEnd == freezed ? _value.timeEnd : timeEnd as String,
      weekDay: weekDay == freezed ? _value.weekDay : weekDay as String,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as int,
      classCapacity: classCapacity == freezed
          ? _value.classCapacity
          : classCapacity as int,
      masters: masters == freezed ? _value.masters : masters as List<Master>,
      attendees:
          attendees == freezed ? _value.attendees : attendees as List<Attendee>,
      acceptedAttendees: acceptedAttendees == freezed
          ? _value.acceptedAttendees
          : acceptedAttendees as List<Attendee>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Lesson implements _Lesson {
  _$_Lesson(
      {this.id,
      this.date,
      this.name,
      this.timeStart,
      this.timeEnd,
      this.weekDay,
      this.timestamp,
      this.classCapacity = config.DEFAULT_CLASS_CAPACITY,
      this.masters = const [],
      this.attendees = const [],
      this.acceptedAttendees = const []})
      : assert(classCapacity != null),
        assert(masters != null),
        assert(attendees != null),
        assert(acceptedAttendees != null);

  factory _$_Lesson.fromJson(Map<String, dynamic> json) =>
      _$_$_LessonFromJson(json);

  @override
  final String id;
  @override
  final String date;
  @override
  final String name;
  @override
  final String timeStart;
  @override
  final String timeEnd;
  @override
  final String weekDay;
  @override
  final int timestamp;
  @JsonKey(defaultValue: config.DEFAULT_CLASS_CAPACITY)
  @override
  final int classCapacity;
  @JsonKey(defaultValue: const [])
  @override
  final List<Master> masters;
  @JsonKey(defaultValue: const [])
  @override
  final List<Attendee> attendees;
  @JsonKey(defaultValue: const [])
  @override
  final List<Attendee> acceptedAttendees;

  @override
  String toString() {
    return 'Lesson(id: $id, date: $date, name: $name, timeStart: $timeStart, timeEnd: $timeEnd, weekDay: $weekDay, timestamp: $timestamp, classCapacity: $classCapacity, masters: $masters, attendees: $attendees, acceptedAttendees: $acceptedAttendees)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Lesson &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.timeStart, timeStart) ||
                const DeepCollectionEquality()
                    .equals(other.timeStart, timeStart)) &&
            (identical(other.timeEnd, timeEnd) ||
                const DeepCollectionEquality()
                    .equals(other.timeEnd, timeEnd)) &&
            (identical(other.weekDay, weekDay) ||
                const DeepCollectionEquality()
                    .equals(other.weekDay, weekDay)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.classCapacity, classCapacity) ||
                const DeepCollectionEquality()
                    .equals(other.classCapacity, classCapacity)) &&
            (identical(other.masters, masters) ||
                const DeepCollectionEquality()
                    .equals(other.masters, masters)) &&
            (identical(other.attendees, attendees) ||
                const DeepCollectionEquality()
                    .equals(other.attendees, attendees)) &&
            (identical(other.acceptedAttendees, acceptedAttendees) ||
                const DeepCollectionEquality()
                    .equals(other.acceptedAttendees, acceptedAttendees)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(timeStart) ^
      const DeepCollectionEquality().hash(timeEnd) ^
      const DeepCollectionEquality().hash(weekDay) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(classCapacity) ^
      const DeepCollectionEquality().hash(masters) ^
      const DeepCollectionEquality().hash(attendees) ^
      const DeepCollectionEquality().hash(acceptedAttendees);

  @override
  _$LessonCopyWith<_Lesson> get copyWith =>
      __$LessonCopyWithImpl<_Lesson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LessonToJson(this);
  }
}

abstract class _Lesson implements Lesson {
  factory _Lesson(
      {String id,
      String date,
      String name,
      String timeStart,
      String timeEnd,
      String weekDay,
      int timestamp,
      int classCapacity,
      List<Master> masters,
      List<Attendee> attendees,
      List<Attendee> acceptedAttendees}) = _$_Lesson;

  factory _Lesson.fromJson(Map<String, dynamic> json) = _$_Lesson.fromJson;

  @override
  String get id;
  @override
  String get date;
  @override
  String get name;
  @override
  String get timeStart;
  @override
  String get timeEnd;
  @override
  String get weekDay;
  @override
  int get timestamp;
  @override
  int get classCapacity;
  @override
  List<Master> get masters;
  @override
  List<Attendee> get attendees;
  @override
  List<Attendee> get acceptedAttendees;
  @override
  _$LessonCopyWith<_Lesson> get copyWith;
}
