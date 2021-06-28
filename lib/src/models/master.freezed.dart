// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'master.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Master _$MasterFromJson(Map<String, dynamic> json) {
  return _Master.fromJson(json);
}

/// @nodoc
class _$MasterTearOff {
  const _$MasterTearOff();

  _Master call(
      {required String name, required String email, String? imageUrl}) {
    return _Master(
      name: name,
      email: email,
      imageUrl: imageUrl,
    );
  }

  Master fromJson(Map<String, Object> json) {
    return Master.fromJson(json);
  }
}

/// @nodoc
const $Master = _$MasterTearOff();

/// @nodoc
mixin _$Master {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MasterCopyWith<Master> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasterCopyWith<$Res> {
  factory $MasterCopyWith(Master value, $Res Function(Master) then) =
      _$MasterCopyWithImpl<$Res>;
  $Res call({String name, String email, String? imageUrl});
}

/// @nodoc
class _$MasterCopyWithImpl<$Res> implements $MasterCopyWith<$Res> {
  _$MasterCopyWithImpl(this._value, this._then);

  final Master _value;
  // ignore: unused_field
  final $Res Function(Master) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MasterCopyWith<$Res> implements $MasterCopyWith<$Res> {
  factory _$MasterCopyWith(_Master value, $Res Function(_Master) then) =
      __$MasterCopyWithImpl<$Res>;
  @override
  $Res call({String name, String email, String? imageUrl});
}

/// @nodoc
class __$MasterCopyWithImpl<$Res> extends _$MasterCopyWithImpl<$Res>
    implements _$MasterCopyWith<$Res> {
  __$MasterCopyWithImpl(_Master _value, $Res Function(_Master) _then)
      : super(_value, (v) => _then(v as _Master));

  @override
  _Master get _value => super._value as _Master;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_Master(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Master implements _Master {
  _$_Master({required this.name, required this.email, this.imageUrl});

  factory _$_Master.fromJson(Map<String, dynamic> json) =>
      _$_$_MasterFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'Master(name: $name, email: $email, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Master &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(imageUrl);

  @JsonKey(ignore: true)
  @override
  _$MasterCopyWith<_Master> get copyWith =>
      __$MasterCopyWithImpl<_Master>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MasterToJson(this);
  }
}

abstract class _Master implements Master {
  factory _Master(
      {required String name,
      required String email,
      String? imageUrl}) = _$_Master;

  factory _Master.fromJson(Map<String, dynamic> json) = _$_Master.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MasterCopyWith<_Master> get copyWith => throw _privateConstructorUsedError;
}
