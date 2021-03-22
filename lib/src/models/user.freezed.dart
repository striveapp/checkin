// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

// ignore: unused_element
  _User call(
      {@required String email,
      @required String imageUrl,
      String name,
      String uid,
      @GradeConverter() Grade grade,
      String selectedGymId,
      List<String> knownGymIds,
      bool hasActivePayments,
      bool isOwner = false}) {
    return _User(
      email: email,
      imageUrl: imageUrl,
      name: name,
      uid: uid,
      grade: grade,
      selectedGymId: selectedGymId,
      knownGymIds: knownGymIds,
      hasActivePayments: hasActivePayments,
      isOwner: isOwner,
    );
  }

// ignore: unused_element
  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get email;
  String get imageUrl;
  String get name;
  String get uid;
  @GradeConverter()
  Grade get grade;
  String get selectedGymId;
  List<String> get knownGymIds;
  bool get hasActivePayments;
  bool get isOwner;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) = _$UserCopyWithImpl<$Res>;
  $Res call(
      {String email,
      String imageUrl,
      String name,
      String uid,
      @GradeConverter() Grade grade,
      String selectedGymId,
      List<String> knownGymIds,
      bool hasActivePayments,
      bool isOwner});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object email = freezed,
    Object imageUrl = freezed,
    Object name = freezed,
    Object uid = freezed,
    Object grade = freezed,
    Object selectedGymId = freezed,
    Object knownGymIds = freezed,
    Object hasActivePayments = freezed,
    Object isOwner = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      name: name == freezed ? _value.name : name as String,
      uid: uid == freezed ? _value.uid : uid as String,
      grade: grade == freezed ? _value.grade : grade as Grade,
      selectedGymId: selectedGymId == freezed ? _value.selectedGymId : selectedGymId as String,
      knownGymIds: knownGymIds == freezed ? _value.knownGymIds : knownGymIds as List<String>,
      hasActivePayments:
          hasActivePayments == freezed ? _value.hasActivePayments : hasActivePayments as bool,
      isOwner: isOwner == freezed ? _value.isOwner : isOwner as bool,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) = __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String email,
      String imageUrl,
      String name,
      String uid,
      @GradeConverter() Grade grade,
      String selectedGymId,
      List<String> knownGymIds,
      bool hasActivePayments,
      bool isOwner});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res> implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object email = freezed,
    Object imageUrl = freezed,
    Object name = freezed,
    Object uid = freezed,
    Object grade = freezed,
    Object selectedGymId = freezed,
    Object knownGymIds = freezed,
    Object hasActivePayments = freezed,
    Object isOwner = freezed,
  }) {
    return _then(_User(
      email: email == freezed ? _value.email : email as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      name: name == freezed ? _value.name : name as String,
      uid: uid == freezed ? _value.uid : uid as String,
      grade: grade == freezed ? _value.grade : grade as Grade,
      selectedGymId: selectedGymId == freezed ? _value.selectedGymId : selectedGymId as String,
      knownGymIds: knownGymIds == freezed ? _value.knownGymIds : knownGymIds as List<String>,
      hasActivePayments:
          hasActivePayments == freezed ? _value.hasActivePayments : hasActivePayments as bool,
      isOwner: isOwner == freezed ? _value.isOwner : isOwner as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_User with DiagnosticableTreeMixin implements _User {
  _$_User(
      {@required this.email,
      @required this.imageUrl,
      this.name,
      this.uid,
      @GradeConverter() this.grade,
      this.selectedGymId,
      this.knownGymIds,
      this.hasActivePayments,
      this.isOwner = false})
      : assert(email != null),
        assert(imageUrl != null),
        assert(isOwner != null);

  factory _$_User.fromJson(Map<String, dynamic> json) => _$_$_UserFromJson(json);

  @override
  final String email;
  @override
  final String imageUrl;
  @override
  final String name;
  @override
  final String uid;
  @override
  @GradeConverter()
  final Grade grade;
  @override
  final String selectedGymId;
  @override
  final List<String> knownGymIds;
  @override
  final bool hasActivePayments;
  @JsonKey(defaultValue: false)
  @override
  final bool isOwner;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(email: $email, imageUrl: $imageUrl, name: $name, uid: $uid, grade: $grade, selectedGymId: $selectedGymId, knownGymIds: $knownGymIds, hasActivePayments: $hasActivePayments, isOwner: $isOwner)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('grade', grade))
      ..add(DiagnosticsProperty('selectedGymId', selectedGymId))
      ..add(DiagnosticsProperty('knownGymIds', knownGymIds))
      ..add(DiagnosticsProperty('hasActivePayments', hasActivePayments))
      ..add(DiagnosticsProperty('isOwner', isOwner));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality().equals(other.imageUrl, imageUrl)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.uid, uid) || const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.grade, grade) ||
                const DeepCollectionEquality().equals(other.grade, grade)) &&
            (identical(other.selectedGymId, selectedGymId) ||
                const DeepCollectionEquality().equals(other.selectedGymId, selectedGymId)) &&
            (identical(other.knownGymIds, knownGymIds) ||
                const DeepCollectionEquality().equals(other.knownGymIds, knownGymIds)) &&
            (identical(other.hasActivePayments, hasActivePayments) ||
                const DeepCollectionEquality()
                    .equals(other.hasActivePayments, hasActivePayments)) &&
            (identical(other.isOwner, isOwner) ||
                const DeepCollectionEquality().equals(other.isOwner, isOwner)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(grade) ^
      const DeepCollectionEquality().hash(selectedGymId) ^
      const DeepCollectionEquality().hash(knownGymIds) ^
      const DeepCollectionEquality().hash(hasActivePayments) ^
      const DeepCollectionEquality().hash(isOwner);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  factory _User(
      {@required String email,
      @required String imageUrl,
      String name,
      String uid,
      @GradeConverter() Grade grade,
      String selectedGymId,
      List<String> knownGymIds,
      bool hasActivePayments,
      bool isOwner}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get email;
  @override
  String get imageUrl;
  @override
  String get name;
  @override
  String get uid;
  @override
  @GradeConverter()
  Grade get grade;
  @override
  String get selectedGymId;
  @override
  List<String> get knownGymIds;
  @override
  bool get hasActivePayments;
  @override
  bool get isOwner;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith;
}
