// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'attendee_with_counter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AttendeeWithCounterTearOff {
  const _$AttendeeWithCounterTearOff();

  _AttendeeWithCounter call({required String email, required int counter}) {
    return _AttendeeWithCounter(
      email: email,
      counter: counter,
    );
  }
}

/// @nodoc
const $AttendeeWithCounter = _$AttendeeWithCounterTearOff();

/// @nodoc
mixin _$AttendeeWithCounter {
  String get email => throw _privateConstructorUsedError;
  int get counter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttendeeWithCounterCopyWith<AttendeeWithCounter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendeeWithCounterCopyWith<$Res> {
  factory $AttendeeWithCounterCopyWith(
          AttendeeWithCounter value, $Res Function(AttendeeWithCounter) then) =
      _$AttendeeWithCounterCopyWithImpl<$Res>;
  $Res call({String email, int counter});
}

/// @nodoc
class _$AttendeeWithCounterCopyWithImpl<$Res>
    implements $AttendeeWithCounterCopyWith<$Res> {
  _$AttendeeWithCounterCopyWithImpl(this._value, this._then);

  final AttendeeWithCounter _value;
  // ignore: unused_field
  final $Res Function(AttendeeWithCounter) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? counter = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      counter: counter == freezed
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$AttendeeWithCounterCopyWith<$Res>
    implements $AttendeeWithCounterCopyWith<$Res> {
  factory _$AttendeeWithCounterCopyWith(_AttendeeWithCounter value,
          $Res Function(_AttendeeWithCounter) then) =
      __$AttendeeWithCounterCopyWithImpl<$Res>;
  @override
  $Res call({String email, int counter});
}

/// @nodoc
class __$AttendeeWithCounterCopyWithImpl<$Res>
    extends _$AttendeeWithCounterCopyWithImpl<$Res>
    implements _$AttendeeWithCounterCopyWith<$Res> {
  __$AttendeeWithCounterCopyWithImpl(
      _AttendeeWithCounter _value, $Res Function(_AttendeeWithCounter) _then)
      : super(_value, (v) => _then(v as _AttendeeWithCounter));

  @override
  _AttendeeWithCounter get _value => super._value as _AttendeeWithCounter;

  @override
  $Res call({
    Object? email = freezed,
    Object? counter = freezed,
  }) {
    return _then(_AttendeeWithCounter(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      counter: counter == freezed
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_AttendeeWithCounter extends _AttendeeWithCounter {
  _$_AttendeeWithCounter({required this.email, required this.counter})
      : super._();

  @override
  final String email;
  @override
  final int counter;

  @override
  String toString() {
    return 'AttendeeWithCounter(email: $email, counter: $counter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AttendeeWithCounter &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.counter, counter) ||
                const DeepCollectionEquality().equals(other.counter, counter)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(counter);

  @JsonKey(ignore: true)
  @override
  _$AttendeeWithCounterCopyWith<_AttendeeWithCounter> get copyWith =>
      __$AttendeeWithCounterCopyWithImpl<_AttendeeWithCounter>(
          this, _$identity);
}

abstract class _AttendeeWithCounter extends AttendeeWithCounter {
  factory _AttendeeWithCounter({required String email, required int counter}) =
      _$_AttendeeWithCounter;
  _AttendeeWithCounter._() : super._();

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  int get counter => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AttendeeWithCounterCopyWith<_AttendeeWithCounter> get copyWith =>
      throw _privateConstructorUsedError;
}
