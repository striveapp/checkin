// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'membership.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$MembershipTearOff {
  const _$MembershipTearOff();

  _Membership call(
      {@required String status,
      String customerId,
      String name,
      int currentPeriodEnd}) {
    return _Membership(
      status: status,
      customerId: customerId,
      name: name,
      currentPeriodEnd: currentPeriodEnd,
    );
  }
}

// ignore: unused_element
const $Membership = _$MembershipTearOff();

mixin _$Membership {
  String get status;
  String get customerId;
  String get name;
  int get currentPeriodEnd;

  $MembershipCopyWith<Membership> get copyWith;
}

abstract class $MembershipCopyWith<$Res> {
  factory $MembershipCopyWith(
          Membership value, $Res Function(Membership) then) =
      _$MembershipCopyWithImpl<$Res>;
  $Res call(
      {String status, String customerId, String name, int currentPeriodEnd});
}

class _$MembershipCopyWithImpl<$Res> implements $MembershipCopyWith<$Res> {
  _$MembershipCopyWithImpl(this._value, this._then);

  final Membership _value;
  // ignore: unused_field
  final $Res Function(Membership) _then;

  @override
  $Res call({
    Object status = freezed,
    Object customerId = freezed,
    Object name = freezed,
    Object currentPeriodEnd = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed ? _value.status : status as String,
      customerId:
          customerId == freezed ? _value.customerId : customerId as String,
      name: name == freezed ? _value.name : name as String,
      currentPeriodEnd: currentPeriodEnd == freezed
          ? _value.currentPeriodEnd
          : currentPeriodEnd as int,
    ));
  }
}

abstract class _$MembershipCopyWith<$Res> implements $MembershipCopyWith<$Res> {
  factory _$MembershipCopyWith(
          _Membership value, $Res Function(_Membership) then) =
      __$MembershipCopyWithImpl<$Res>;
  @override
  $Res call(
      {String status, String customerId, String name, int currentPeriodEnd});
}

class __$MembershipCopyWithImpl<$Res> extends _$MembershipCopyWithImpl<$Res>
    implements _$MembershipCopyWith<$Res> {
  __$MembershipCopyWithImpl(
      _Membership _value, $Res Function(_Membership) _then)
      : super(_value, (v) => _then(v as _Membership));

  @override
  _Membership get _value => super._value as _Membership;

  @override
  $Res call({
    Object status = freezed,
    Object customerId = freezed,
    Object name = freezed,
    Object currentPeriodEnd = freezed,
  }) {
    return _then(_Membership(
      status: status == freezed ? _value.status : status as String,
      customerId:
          customerId == freezed ? _value.customerId : customerId as String,
      name: name == freezed ? _value.name : name as String,
      currentPeriodEnd: currentPeriodEnd == freezed
          ? _value.currentPeriodEnd
          : currentPeriodEnd as int,
    ));
  }
}

class _$_Membership with DiagnosticableTreeMixin implements _Membership {
  _$_Membership(
      {@required this.status,
      this.customerId,
      this.name,
      this.currentPeriodEnd})
      : assert(status != null);

  @override
  final String status;
  @override
  final String customerId;
  @override
  final String name;
  @override
  final int currentPeriodEnd;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Membership(status: $status, customerId: $customerId, name: $name, currentPeriodEnd: $currentPeriodEnd)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Membership'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('customerId', customerId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('currentPeriodEnd', currentPeriodEnd));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Membership &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.customerId, customerId) ||
                const DeepCollectionEquality()
                    .equals(other.customerId, customerId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.currentPeriodEnd, currentPeriodEnd) ||
                const DeepCollectionEquality()
                    .equals(other.currentPeriodEnd, currentPeriodEnd)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(customerId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(currentPeriodEnd);

  @override
  _$MembershipCopyWith<_Membership> get copyWith =>
      __$MembershipCopyWithImpl<_Membership>(this, _$identity);
}

abstract class _Membership implements Membership {
  factory _Membership(
      {@required String status,
      String customerId,
      String name,
      int currentPeriodEnd}) = _$_Membership;

  @override
  String get status;
  @override
  String get customerId;
  @override
  String get name;
  @override
  int get currentPeriodEnd;
  @override
  _$MembershipCopyWith<_Membership> get copyWith;
}
