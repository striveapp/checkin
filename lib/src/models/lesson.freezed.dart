// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'lesson.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Lesson _$LessonFromJson(Map<String, dynamic> json) {
  return _Lesson.fromJson(json);
}

/// @nodoc
class _$LessonTearOff {
  const _$LessonTearOff();

  _Lesson call(
      {String? id,
      String? date,
      String? name,
      String? timeStart,
      String timeEnd = "",
      @WeekdayConverter() Weekday? weekDay,
      int? timestamp,
      String? imageUrl,
      String? gymId,
      LessonConfig? lessonConfig,
      String? locationUrl,
      int classCapacity = DEFAULT_CLASS_CAPACITY,
      List<Master> masters = const [],
      List<Attendee> attendees = const [],
      List<Attendee> acceptedAttendees = const [],
      bool isClosed = false}) {
    return _Lesson(
      id: id,
      date: date,
      name: name,
      timeStart: timeStart,
      timeEnd: timeEnd,
      weekDay: weekDay,
      timestamp: timestamp,
      imageUrl: imageUrl,
      gymId: gymId,
      lessonConfig: lessonConfig,
      locationUrl: locationUrl,
      classCapacity: classCapacity,
      masters: masters,
      attendees: attendees,
      acceptedAttendees: acceptedAttendees,
      isClosed: isClosed,
    );
  }

  Lesson fromJson(Map<String, Object> json) {
    return Lesson.fromJson(json);
  }
}

/// @nodoc
const $Lesson = _$LessonTearOff();

/// @nodoc
mixin _$Lesson {
  String? get id => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get timeStart => throw _privateConstructorUsedError;
  String get timeEnd => throw _privateConstructorUsedError;
  @WeekdayConverter()
  Weekday? get weekDay => throw _privateConstructorUsedError;
  int? get timestamp => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get gymId => throw _privateConstructorUsedError;
  LessonConfig? get lessonConfig => throw _privateConstructorUsedError;
  String? get locationUrl =>
      throw _privateConstructorUsedError; // todo retrieve from Gym (config) https://trello.com/c/uIqJLgZL
  int get classCapacity => throw _privateConstructorUsedError;
  List<Master> get masters => throw _privateConstructorUsedError;
  List<Attendee> get attendees => throw _privateConstructorUsedError;
  List<Attendee> get acceptedAttendees => throw _privateConstructorUsedError;
  bool get isClosed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonCopyWith<Lesson> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonCopyWith<$Res> {
  factory $LessonCopyWith(Lesson value, $Res Function(Lesson) then) = _$LessonCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? date,
      String? name,
      String? timeStart,
      String timeEnd,
      @WeekdayConverter() Weekday? weekDay,
      int? timestamp,
      String? imageUrl,
      String? gymId,
      LessonConfig? lessonConfig,
      String? locationUrl,
      int classCapacity,
      List<Master> masters,
      List<Attendee> attendees,
      List<Attendee> acceptedAttendees,
      bool isClosed});

  $LessonConfigCopyWith<$Res>? get lessonConfig;
}

/// @nodoc
class _$LessonCopyWithImpl<$Res> implements $LessonCopyWith<$Res> {
  _$LessonCopyWithImpl(this._value, this._then);

  final Lesson _value;
  // ignore: unused_field
  final $Res Function(Lesson) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? name = freezed,
    Object? timeStart = freezed,
    Object? timeEnd = freezed,
    Object? weekDay = freezed,
    Object? timestamp = freezed,
    Object? imageUrl = freezed,
    Object? gymId = freezed,
    Object? lessonConfig = freezed,
    Object? locationUrl = freezed,
    Object? classCapacity = freezed,
    Object? masters = freezed,
    Object? attendees = freezed,
    Object? acceptedAttendees = freezed,
    Object? isClosed = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      timeStart: timeStart == freezed
          ? _value.timeStart
          : timeStart // ignore: cast_nullable_to_non_nullable
              as String?,
      timeEnd: timeEnd == freezed
          ? _value.timeEnd
          : timeEnd // ignore: cast_nullable_to_non_nullable
              as String,
      weekDay: weekDay == freezed
          ? _value.weekDay
          : weekDay // ignore: cast_nullable_to_non_nullable
              as Weekday?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      gymId: gymId == freezed
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonConfig: lessonConfig == freezed
          ? _value.lessonConfig
          : lessonConfig // ignore: cast_nullable_to_non_nullable
              as LessonConfig?,
      locationUrl: locationUrl == freezed
          ? _value.locationUrl
          : locationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      classCapacity: classCapacity == freezed
          ? _value.classCapacity
          : classCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      masters: masters == freezed
          ? _value.masters
          : masters // ignore: cast_nullable_to_non_nullable
              as List<Master>,
      attendees: attendees == freezed
          ? _value.attendees
          : attendees // ignore: cast_nullable_to_non_nullable
              as List<Attendee>,
      acceptedAttendees: acceptedAttendees == freezed
          ? _value.acceptedAttendees
          : acceptedAttendees // ignore: cast_nullable_to_non_nullable
              as List<Attendee>,
      isClosed: isClosed == freezed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $LessonConfigCopyWith<$Res>? get lessonConfig {
    if (_value.lessonConfig == null) {
      return null;
    }

    return $LessonConfigCopyWith<$Res>(_value.lessonConfig!, (value) {
      return _then(_value.copyWith(lessonConfig: value));
    });
  }
}

/// @nodoc
abstract class _$LessonCopyWith<$Res> implements $LessonCopyWith<$Res> {
  factory _$LessonCopyWith(_Lesson value, $Res Function(_Lesson) then) =
      __$LessonCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? date,
      String? name,
      String? timeStart,
      String timeEnd,
      @WeekdayConverter() Weekday? weekDay,
      int? timestamp,
      String? imageUrl,
      String? gymId,
      LessonConfig? lessonConfig,
      String? locationUrl,
      int classCapacity,
      List<Master> masters,
      List<Attendee> attendees,
      List<Attendee> acceptedAttendees,
      bool isClosed});

  @override
  $LessonConfigCopyWith<$Res>? get lessonConfig;
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
    Object? id = freezed,
    Object? date = freezed,
    Object? name = freezed,
    Object? timeStart = freezed,
    Object? timeEnd = freezed,
    Object? weekDay = freezed,
    Object? timestamp = freezed,
    Object? imageUrl = freezed,
    Object? gymId = freezed,
    Object? lessonConfig = freezed,
    Object? locationUrl = freezed,
    Object? classCapacity = freezed,
    Object? masters = freezed,
    Object? attendees = freezed,
    Object? acceptedAttendees = freezed,
    Object? isClosed = freezed,
  }) {
    return _then(_Lesson(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      timeStart: timeStart == freezed
          ? _value.timeStart
          : timeStart // ignore: cast_nullable_to_non_nullable
              as String?,
      timeEnd: timeEnd == freezed
          ? _value.timeEnd
          : timeEnd // ignore: cast_nullable_to_non_nullable
              as String,
      weekDay: weekDay == freezed
          ? _value.weekDay
          : weekDay // ignore: cast_nullable_to_non_nullable
              as Weekday?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      gymId: gymId == freezed
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonConfig: lessonConfig == freezed
          ? _value.lessonConfig
          : lessonConfig // ignore: cast_nullable_to_non_nullable
              as LessonConfig?,
      locationUrl: locationUrl == freezed
          ? _value.locationUrl
          : locationUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      classCapacity: classCapacity == freezed
          ? _value.classCapacity
          : classCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      masters: masters == freezed
          ? _value.masters
          : masters // ignore: cast_nullable_to_non_nullable
              as List<Master>,
      attendees: attendees == freezed
          ? _value.attendees
          : attendees // ignore: cast_nullable_to_non_nullable
              as List<Attendee>,
      acceptedAttendees: acceptedAttendees == freezed
          ? _value.acceptedAttendees
          : acceptedAttendees // ignore: cast_nullable_to_non_nullable
              as List<Attendee>,
      isClosed: isClosed == freezed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Lesson implements _Lesson {
  _$_Lesson(
      {this.id,
      this.date,
      this.name,
      this.timeStart,
      this.timeEnd = "",
      @WeekdayConverter() this.weekDay,
      this.timestamp,
      this.imageUrl,
      this.gymId,
      this.lessonConfig,
      this.locationUrl,
      this.classCapacity = DEFAULT_CLASS_CAPACITY,
      this.masters = const [],
      this.attendees = const [],
      this.acceptedAttendees = const [],
      this.isClosed = false});

  factory _$_Lesson.fromJson(Map<String, dynamic> json) => _$_$_LessonFromJson(json);

  @override
  final String? id;
  @override
  final String? date;
  @override
  final String? name;
  @override
  final String? timeStart;
  @JsonKey(defaultValue: "")
  @override
  final String timeEnd;
  @override
  @WeekdayConverter()
  final Weekday? weekDay;
  @override
  final int? timestamp;
  @override
  final String? imageUrl;
  @override
  final String? gymId;
  @override
  final LessonConfig? lessonConfig;
  @override
  final String? locationUrl;
  @JsonKey(defaultValue: DEFAULT_CLASS_CAPACITY)
  @override // todo retrieve from Gym (config) https://trello.com/c/uIqJLgZL
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
  @JsonKey(defaultValue: false)
  @override
  final bool isClosed;

  @override
  String toString() {
    return 'Lesson(id: $id, date: $date, name: $name, timeStart: $timeStart, timeEnd: $timeEnd, weekDay: $weekDay, timestamp: $timestamp, imageUrl: $imageUrl, gymId: $gymId, lessonConfig: $lessonConfig, locationUrl: $locationUrl, classCapacity: $classCapacity, masters: $masters, attendees: $attendees, acceptedAttendees: $acceptedAttendees, isClosed: $isClosed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Lesson &&
            (identical(other.id, id) || const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.timeStart, timeStart) ||
                const DeepCollectionEquality().equals(other.timeStart, timeStart)) &&
            (identical(other.timeEnd, timeEnd) ||
                const DeepCollectionEquality().equals(other.timeEnd, timeEnd)) &&
            (identical(other.weekDay, weekDay) ||
                const DeepCollectionEquality().equals(other.weekDay, weekDay)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality().equals(other.timestamp, timestamp)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality().equals(other.imageUrl, imageUrl)) &&
            (identical(other.gymId, gymId) ||
                const DeepCollectionEquality().equals(other.gymId, gymId)) &&
            (identical(other.lessonConfig, lessonConfig) ||
                const DeepCollectionEquality().equals(other.lessonConfig, lessonConfig)) &&
            (identical(other.locationUrl, locationUrl) ||
                const DeepCollectionEquality().equals(other.locationUrl, locationUrl)) &&
            (identical(other.classCapacity, classCapacity) ||
                const DeepCollectionEquality().equals(other.classCapacity, classCapacity)) &&
            (identical(other.masters, masters) ||
                const DeepCollectionEquality().equals(other.masters, masters)) &&
            (identical(other.attendees, attendees) ||
                const DeepCollectionEquality().equals(other.attendees, attendees)) &&
            (identical(other.acceptedAttendees, acceptedAttendees) ||
                const DeepCollectionEquality()
                    .equals(other.acceptedAttendees, acceptedAttendees)) &&
            (identical(other.isClosed, isClosed) ||
                const DeepCollectionEquality().equals(other.isClosed, isClosed)));
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
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(gymId) ^
      const DeepCollectionEquality().hash(lessonConfig) ^
      const DeepCollectionEquality().hash(locationUrl) ^
      const DeepCollectionEquality().hash(classCapacity) ^
      const DeepCollectionEquality().hash(masters) ^
      const DeepCollectionEquality().hash(attendees) ^
      const DeepCollectionEquality().hash(acceptedAttendees) ^
      const DeepCollectionEquality().hash(isClosed);

  @JsonKey(ignore: true)
  @override
  _$LessonCopyWith<_Lesson> get copyWith => __$LessonCopyWithImpl<_Lesson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LessonToJson(this);
  }
}

abstract class _Lesson implements Lesson {
  factory _Lesson(
      {String? id,
      String? date,
      String? name,
      String? timeStart,
      String timeEnd,
      @WeekdayConverter() Weekday? weekDay,
      int? timestamp,
      String? imageUrl,
      String? gymId,
      LessonConfig? lessonConfig,
      String? locationUrl,
      int classCapacity,
      List<Master> masters,
      List<Attendee> attendees,
      List<Attendee> acceptedAttendees,
      bool isClosed}) = _$_Lesson;

  factory _Lesson.fromJson(Map<String, dynamic> json) = _$_Lesson.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get date => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get timeStart => throw _privateConstructorUsedError;
  @override
  String get timeEnd => throw _privateConstructorUsedError;
  @override
  @WeekdayConverter()
  Weekday? get weekDay => throw _privateConstructorUsedError;
  @override
  int? get timestamp => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  String? get gymId => throw _privateConstructorUsedError;
  @override
  LessonConfig? get lessonConfig => throw _privateConstructorUsedError;
  @override
  String? get locationUrl => throw _privateConstructorUsedError;
  @override // todo retrieve from Gym (config) https://trello.com/c/uIqJLgZL
  int get classCapacity => throw _privateConstructorUsedError;
  @override
  List<Master> get masters => throw _privateConstructorUsedError;
  @override
  List<Attendee> get attendees => throw _privateConstructorUsedError;
  @override
  List<Attendee> get acceptedAttendees => throw _privateConstructorUsedError;
  @override
  bool get isClosed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LessonCopyWith<_Lesson> get copyWith => throw _privateConstructorUsedError;
}

LessonTemplate _$LessonTemplateFromJson(Map<String, dynamic> json) {
  return _LessonTemplate.fromJson(json);
}

/// @nodoc
class _$LessonTemplateTearOff {
  const _$LessonTemplateTearOff();

  _LessonTemplate call(
      {String? id,
      String? name,
      String? timeStart,
      String timeEnd = "",
      Weekday? weekDay,
      String? imageUrl,
      LessonConfig? lessonConfig,
      int classCapacity = DEFAULT_CLASS_CAPACITY,
      List<Master> masters = const []}) {
    return _LessonTemplate(
      id: id,
      name: name,
      timeStart: timeStart,
      timeEnd: timeEnd,
      weekDay: weekDay,
      imageUrl: imageUrl,
      lessonConfig: lessonConfig,
      classCapacity: classCapacity,
      masters: masters,
    );
  }

  LessonTemplate fromJson(Map<String, Object> json) {
    return LessonTemplate.fromJson(json);
  }
}

/// @nodoc
const $LessonTemplate = _$LessonTemplateTearOff();

/// @nodoc
mixin _$LessonTemplate {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get timeStart => throw _privateConstructorUsedError;
  String get timeEnd => throw _privateConstructorUsedError;
  Weekday? get weekDay => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  LessonConfig? get lessonConfig =>
      throw _privateConstructorUsedError; // todo retrieve from Gym (config) https://trello.com/c/uIqJLgZL
  int get classCapacity => throw _privateConstructorUsedError;
  List<Master> get masters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonTemplateCopyWith<LessonTemplate> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonTemplateCopyWith<$Res> {
  factory $LessonTemplateCopyWith(LessonTemplate value, $Res Function(LessonTemplate) then) =
      _$LessonTemplateCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? name,
      String? timeStart,
      String timeEnd,
      Weekday? weekDay,
      String? imageUrl,
      LessonConfig? lessonConfig,
      int classCapacity,
      List<Master> masters});

  $LessonConfigCopyWith<$Res>? get lessonConfig;
}

/// @nodoc
class _$LessonTemplateCopyWithImpl<$Res> implements $LessonTemplateCopyWith<$Res> {
  _$LessonTemplateCopyWithImpl(this._value, this._then);

  final LessonTemplate _value;
  // ignore: unused_field
  final $Res Function(LessonTemplate) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? timeStart = freezed,
    Object? timeEnd = freezed,
    Object? weekDay = freezed,
    Object? imageUrl = freezed,
    Object? lessonConfig = freezed,
    Object? classCapacity = freezed,
    Object? masters = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      timeStart: timeStart == freezed
          ? _value.timeStart
          : timeStart // ignore: cast_nullable_to_non_nullable
              as String?,
      timeEnd: timeEnd == freezed
          ? _value.timeEnd
          : timeEnd // ignore: cast_nullable_to_non_nullable
              as String,
      weekDay: weekDay == freezed
          ? _value.weekDay
          : weekDay // ignore: cast_nullable_to_non_nullable
              as Weekday?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonConfig: lessonConfig == freezed
          ? _value.lessonConfig
          : lessonConfig // ignore: cast_nullable_to_non_nullable
              as LessonConfig?,
      classCapacity: classCapacity == freezed
          ? _value.classCapacity
          : classCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      masters: masters == freezed
          ? _value.masters
          : masters // ignore: cast_nullable_to_non_nullable
              as List<Master>,
    ));
  }

  @override
  $LessonConfigCopyWith<$Res>? get lessonConfig {
    if (_value.lessonConfig == null) {
      return null;
    }

    return $LessonConfigCopyWith<$Res>(_value.lessonConfig!, (value) {
      return _then(_value.copyWith(lessonConfig: value));
    });
  }
}

/// @nodoc
abstract class _$LessonTemplateCopyWith<$Res> implements $LessonTemplateCopyWith<$Res> {
  factory _$LessonTemplateCopyWith(_LessonTemplate value, $Res Function(_LessonTemplate) then) =
      __$LessonTemplateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? name,
      String? timeStart,
      String timeEnd,
      Weekday? weekDay,
      String? imageUrl,
      LessonConfig? lessonConfig,
      int classCapacity,
      List<Master> masters});

  @override
  $LessonConfigCopyWith<$Res>? get lessonConfig;
}

/// @nodoc
class __$LessonTemplateCopyWithImpl<$Res> extends _$LessonTemplateCopyWithImpl<$Res>
    implements _$LessonTemplateCopyWith<$Res> {
  __$LessonTemplateCopyWithImpl(_LessonTemplate _value, $Res Function(_LessonTemplate) _then)
      : super(_value, (v) => _then(v as _LessonTemplate));

  @override
  _LessonTemplate get _value => super._value as _LessonTemplate;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? timeStart = freezed,
    Object? timeEnd = freezed,
    Object? weekDay = freezed,
    Object? imageUrl = freezed,
    Object? lessonConfig = freezed,
    Object? classCapacity = freezed,
    Object? masters = freezed,
  }) {
    return _then(_LessonTemplate(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      timeStart: timeStart == freezed
          ? _value.timeStart
          : timeStart // ignore: cast_nullable_to_non_nullable
              as String?,
      timeEnd: timeEnd == freezed
          ? _value.timeEnd
          : timeEnd // ignore: cast_nullable_to_non_nullable
              as String,
      weekDay: weekDay == freezed
          ? _value.weekDay
          : weekDay // ignore: cast_nullable_to_non_nullable
              as Weekday?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonConfig: lessonConfig == freezed
          ? _value.lessonConfig
          : lessonConfig // ignore: cast_nullable_to_non_nullable
              as LessonConfig?,
      classCapacity: classCapacity == freezed
          ? _value.classCapacity
          : classCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      masters: masters == freezed
          ? _value.masters
          : masters // ignore: cast_nullable_to_non_nullable
              as List<Master>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LessonTemplate implements _LessonTemplate {
  _$_LessonTemplate(
      {this.id,
      this.name,
      this.timeStart,
      this.timeEnd = "",
      this.weekDay,
      this.imageUrl,
      this.lessonConfig,
      this.classCapacity = DEFAULT_CLASS_CAPACITY,
      this.masters = const []});

  factory _$_LessonTemplate.fromJson(Map<String, dynamic> json) =>
      _$_$_LessonTemplateFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? timeStart;
  @JsonKey(defaultValue: "")
  @override
  final String timeEnd;
  @override
  final Weekday? weekDay;
  @override
  final String? imageUrl;
  @override
  final LessonConfig? lessonConfig;
  @JsonKey(defaultValue: DEFAULT_CLASS_CAPACITY)
  @override // todo retrieve from Gym (config) https://trello.com/c/uIqJLgZL
  final int classCapacity;
  @JsonKey(defaultValue: const [])
  @override
  final List<Master> masters;

  @override
  String toString() {
    return 'LessonTemplate(id: $id, name: $name, timeStart: $timeStart, timeEnd: $timeEnd, weekDay: $weekDay, imageUrl: $imageUrl, lessonConfig: $lessonConfig, classCapacity: $classCapacity, masters: $masters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LessonTemplate &&
            (identical(other.id, id) || const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.timeStart, timeStart) ||
                const DeepCollectionEquality().equals(other.timeStart, timeStart)) &&
            (identical(other.timeEnd, timeEnd) ||
                const DeepCollectionEquality().equals(other.timeEnd, timeEnd)) &&
            (identical(other.weekDay, weekDay) ||
                const DeepCollectionEquality().equals(other.weekDay, weekDay)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality().equals(other.imageUrl, imageUrl)) &&
            (identical(other.lessonConfig, lessonConfig) ||
                const DeepCollectionEquality().equals(other.lessonConfig, lessonConfig)) &&
            (identical(other.classCapacity, classCapacity) ||
                const DeepCollectionEquality().equals(other.classCapacity, classCapacity)) &&
            (identical(other.masters, masters) ||
                const DeepCollectionEquality().equals(other.masters, masters)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(timeStart) ^
      const DeepCollectionEquality().hash(timeEnd) ^
      const DeepCollectionEquality().hash(weekDay) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(lessonConfig) ^
      const DeepCollectionEquality().hash(classCapacity) ^
      const DeepCollectionEquality().hash(masters);

  @JsonKey(ignore: true)
  @override
  _$LessonTemplateCopyWith<_LessonTemplate> get copyWith =>
      __$LessonTemplateCopyWithImpl<_LessonTemplate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LessonTemplateToJson(this);
  }
}

abstract class _LessonTemplate implements LessonTemplate {
  factory _LessonTemplate(
      {String? id,
      String? name,
      String? timeStart,
      String timeEnd,
      Weekday? weekDay,
      String? imageUrl,
      LessonConfig? lessonConfig,
      int classCapacity,
      List<Master> masters}) = _$_LessonTemplate;

  factory _LessonTemplate.fromJson(Map<String, dynamic> json) = _$_LessonTemplate.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get timeStart => throw _privateConstructorUsedError;
  @override
  String get timeEnd => throw _privateConstructorUsedError;
  @override
  Weekday? get weekDay => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  LessonConfig? get lessonConfig => throw _privateConstructorUsedError;
  @override // todo retrieve from Gym (config) https://trello.com/c/uIqJLgZL
  int get classCapacity => throw _privateConstructorUsedError;
  @override
  List<Master> get masters => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LessonTemplateCopyWith<_LessonTemplate> get copyWith => throw _privateConstructorUsedError;
}
