// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'graduation_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GraduationEventTearOff {
  const _$GraduationEventTearOff();

// ignore: unused_element
  GraduationSystemUpdated graduationSystemUpdated() {
    return const GraduationSystemUpdated();
  }
}

/// @nodoc
// ignore: unused_element
const $GraduationEvent = _$GraduationEventTearOff();

/// @nodoc
mixin _$GraduationEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result graduationSystemUpdated(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result graduationSystemUpdated(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result graduationSystemUpdated(GraduationSystemUpdated value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result graduationSystemUpdated(GraduationSystemUpdated value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $GraduationEventCopyWith<$Res> {
  factory $GraduationEventCopyWith(
          GraduationEvent value, $Res Function(GraduationEvent) then) =
      _$GraduationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$GraduationEventCopyWithImpl<$Res>
    implements $GraduationEventCopyWith<$Res> {
  _$GraduationEventCopyWithImpl(this._value, this._then);

  final GraduationEvent _value;
  // ignore: unused_field
  final $Res Function(GraduationEvent) _then;
}

/// @nodoc
abstract class $GraduationSystemUpdatedCopyWith<$Res> {
  factory $GraduationSystemUpdatedCopyWith(GraduationSystemUpdated value,
          $Res Function(GraduationSystemUpdated) then) =
      _$GraduationSystemUpdatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$GraduationSystemUpdatedCopyWithImpl<$Res>
    extends _$GraduationEventCopyWithImpl<$Res>
    implements $GraduationSystemUpdatedCopyWith<$Res> {
  _$GraduationSystemUpdatedCopyWithImpl(GraduationSystemUpdated _value,
      $Res Function(GraduationSystemUpdated) _then)
      : super(_value, (v) => _then(v as GraduationSystemUpdated));

  @override
  GraduationSystemUpdated get _value => super._value as GraduationSystemUpdated;
}

/// @nodoc
class _$GraduationSystemUpdated
    with DiagnosticableTreeMixin
    implements GraduationSystemUpdated {
  const _$GraduationSystemUpdated();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GraduationEvent.graduationSystemUpdated()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'GraduationEvent.graduationSystemUpdated'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GraduationSystemUpdated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result graduationSystemUpdated(),
  }) {
    assert(graduationSystemUpdated != null);
    return graduationSystemUpdated();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result graduationSystemUpdated(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (graduationSystemUpdated != null) {
      return graduationSystemUpdated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result graduationSystemUpdated(GraduationSystemUpdated value),
  }) {
    assert(graduationSystemUpdated != null);
    return graduationSystemUpdated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result graduationSystemUpdated(GraduationSystemUpdated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (graduationSystemUpdated != null) {
      return graduationSystemUpdated(this);
    }
    return orElse();
  }
}

abstract class GraduationSystemUpdated implements GraduationEvent {
  const factory GraduationSystemUpdated() = _$GraduationSystemUpdated;
}
