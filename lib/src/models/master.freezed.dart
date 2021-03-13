// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'master.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Master _$MasterFromJson(Map<String, dynamic> json) {
  return _Master.fromJson(json);
}

/// @nodoc
class _$MasterTearOff {
  const _$MasterTearOff();

// ignore: unused_element
  _Master call({dynamic name, dynamic email, dynamic imageUrl}) {
    return _Master(
      name: name,
      email: email,
      imageUrl: imageUrl,
    );
  }

// ignore: unused_element
  Master fromJson(Map<String, Object> json) {
    return Master.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Master = _$MasterTearOff();

/// @nodoc
mixin _$Master {
  dynamic get name;
  dynamic get email;
  dynamic get imageUrl;

  Map<String, dynamic> toJson();
  $MasterCopyWith<Master> get copyWith;
}

/// @nodoc
abstract class $MasterCopyWith<$Res> {
  factory $MasterCopyWith(Master value, $Res Function(Master) then) =
      _$MasterCopyWithImpl<$Res>;
  $Res call({dynamic name, dynamic email, dynamic imageUrl});
}

/// @nodoc
class _$MasterCopyWithImpl<$Res> implements $MasterCopyWith<$Res> {
  _$MasterCopyWithImpl(this._value, this._then);

  final Master _value;
  // ignore: unused_field
  final $Res Function(Master) _then;

  @override
  $Res call({
    Object name = freezed,
    Object email = freezed,
    Object imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as dynamic,
      email: email == freezed ? _value.email : email as dynamic,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$MasterCopyWith<$Res> implements $MasterCopyWith<$Res> {
  factory _$MasterCopyWith(_Master value, $Res Function(_Master) then) =
      __$MasterCopyWithImpl<$Res>;
  @override
  $Res call({dynamic name, dynamic email, dynamic imageUrl});
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
    Object name = freezed,
    Object email = freezed,
    Object imageUrl = freezed,
  }) {
    return _then(_Master(
      name: name == freezed ? _value.name : name,
      email: email == freezed ? _value.email : email,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Master implements _Master {
  _$_Master({this.name, this.email, this.imageUrl});

  factory _$_Master.fromJson(Map<String, dynamic> json) =>
      _$_$_MasterFromJson(json);

  @override
  final dynamic name;
  @override
  final dynamic email;
  @override
  final dynamic imageUrl;

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

  @override
  _$MasterCopyWith<_Master> get copyWith =>
      __$MasterCopyWithImpl<_Master>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MasterToJson(this);
  }
}

abstract class _Master implements Master {
  factory _Master({dynamic name, dynamic email, dynamic imageUrl}) = _$_Master;

  factory _Master.fromJson(Map<String, dynamic> json) = _$_Master.fromJson;

  @override
  dynamic get name;
  @override
  dynamic get email;
  @override
  dynamic get imageUrl;
  @override
  _$MasterCopyWith<_Master> get copyWith;
}
