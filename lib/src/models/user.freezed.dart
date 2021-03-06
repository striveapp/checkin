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
      {@required String name,
      @required String email,
      @required String imageUrl,
      String uid,
      Grade grade,
      String selectedGymId,
      List<String> knownGymIds,
      bool isOwner = false,
      bool hasActivePayments = false}) {
    return _User(
      name: name,
      email: email,
      imageUrl: imageUrl,
      uid: uid,
      grade: grade,
      selectedGymId: selectedGymId,
      knownGymIds: knownGymIds,
      isOwner: isOwner,
      hasActivePayments: hasActivePayments,
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
  String get name;
  String get email;
  String get imageUrl;
  String get uid;
  Grade get grade;
  String get selectedGymId;
  List<String> get knownGymIds;
  bool get isOwner;
  bool get hasActivePayments;

  Map<String, dynamic> toJson();
  $UserCopyWith<User> get copyWith;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String email,
      String imageUrl,
      String uid,
      Grade grade,
      String selectedGymId,
      List<String> knownGymIds,
      bool isOwner,
      bool hasActivePayments});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object name = freezed,
    Object email = freezed,
    Object imageUrl = freezed,
    Object uid = freezed,
    Object grade = freezed,
    Object selectedGymId = freezed,
    Object knownGymIds = freezed,
    Object isOwner = freezed,
    Object hasActivePayments = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      email: email == freezed ? _value.email : email as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      uid: uid == freezed ? _value.uid : uid as String,
      grade: grade == freezed ? _value.grade : grade as Grade,
      selectedGymId: selectedGymId == freezed
          ? _value.selectedGymId
          : selectedGymId as String,
      knownGymIds: knownGymIds == freezed
          ? _value.knownGymIds
          : knownGymIds as List<String>,
      isOwner: isOwner == freezed ? _value.isOwner : isOwner as bool,
      hasActivePayments: hasActivePayments == freezed
          ? _value.hasActivePayments
          : hasActivePayments as bool,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String email,
      String imageUrl,
      String uid,
      Grade grade,
      String selectedGymId,
      List<String> knownGymIds,
      bool isOwner,
      bool hasActivePayments});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object name = freezed,
    Object email = freezed,
    Object imageUrl = freezed,
    Object uid = freezed,
    Object grade = freezed,
    Object selectedGymId = freezed,
    Object knownGymIds = freezed,
    Object isOwner = freezed,
    Object hasActivePayments = freezed,
  }) {
    return _then(_User(
      name: name == freezed ? _value.name : name as String,
      email: email == freezed ? _value.email : email as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      uid: uid == freezed ? _value.uid : uid as String,
      grade: grade == freezed ? _value.grade : grade as Grade,
      selectedGymId: selectedGymId == freezed
          ? _value.selectedGymId
          : selectedGymId as String,
      knownGymIds: knownGymIds == freezed
          ? _value.knownGymIds
          : knownGymIds as List<String>,
      isOwner: isOwner == freezed ? _value.isOwner : isOwner as bool,
      hasActivePayments: hasActivePayments == freezed
          ? _value.hasActivePayments
          : hasActivePayments as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_User with DiagnosticableTreeMixin implements _User {
  _$_User(
      {@required this.name,
      @required this.email,
      @required this.imageUrl,
      this.uid,
      this.grade,
      this.selectedGymId,
      this.knownGymIds,
      this.isOwner = false,
      this.hasActivePayments = false})
      : assert(name != null),
        assert(email != null),
        assert(imageUrl != null),
        assert(isOwner != null),
        assert(hasActivePayments != null);

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String imageUrl;
  @override
  final String uid;
  @override
  final Grade grade;
  @override
  final String selectedGymId;
  @override
  final List<String> knownGymIds;
  @JsonKey(defaultValue: false)
  @override
  final bool isOwner;
  @JsonKey(defaultValue: false)
  @override
  final bool hasActivePayments;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(name: $name, email: $email, imageUrl: $imageUrl, uid: $uid, grade: $grade, selectedGymId: $selectedGymId, knownGymIds: $knownGymIds, isOwner: $isOwner, hasActivePayments: $hasActivePayments)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('grade', grade))
      ..add(DiagnosticsProperty('selectedGymId', selectedGymId))
      ..add(DiagnosticsProperty('knownGymIds', knownGymIds))
      ..add(DiagnosticsProperty('isOwner', isOwner))
      ..add(DiagnosticsProperty('hasActivePayments', hasActivePayments));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.grade, grade) ||
                const DeepCollectionEquality().equals(other.grade, grade)) &&
            (identical(other.selectedGymId, selectedGymId) ||
                const DeepCollectionEquality()
                    .equals(other.selectedGymId, selectedGymId)) &&
            (identical(other.knownGymIds, knownGymIds) ||
                const DeepCollectionEquality()
                    .equals(other.knownGymIds, knownGymIds)) &&
            (identical(other.isOwner, isOwner) ||
                const DeepCollectionEquality()
                    .equals(other.isOwner, isOwner)) &&
            (identical(other.hasActivePayments, hasActivePayments) ||
                const DeepCollectionEquality()
                    .equals(other.hasActivePayments, hasActivePayments)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(grade) ^
      const DeepCollectionEquality().hash(selectedGymId) ^
      const DeepCollectionEquality().hash(knownGymIds) ^
      const DeepCollectionEquality().hash(isOwner) ^
      const DeepCollectionEquality().hash(hasActivePayments);

  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  factory _User(
      {@required String name,
      @required String email,
      @required String imageUrl,
      String uid,
      Grade grade,
      String selectedGymId,
      List<String> knownGymIds,
      bool isOwner,
      bool hasActivePayments}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get imageUrl;
  @override
  String get uid;
  @override
  Grade get grade;
  @override
  String get selectedGymId;
  @override
  List<String> get knownGymIds;
  @override
  bool get isOwner;
  @override
  bool get hasActivePayments;
  @override
  _$UserCopyWith<_User> get copyWith;
}
