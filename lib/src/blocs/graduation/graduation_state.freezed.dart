// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'graduation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$GraduationStateTearOff {
  const _$GraduationStateTearOff();

// ignore: unused_element
  InitialGraduationState initialGraduationState() {
    return const InitialGraduationState();
  }
}

/// @nodoc
// ignore: unused_element
const $GraduationState = _$GraduationStateTearOff();

/// @nodoc
mixin _$GraduationState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialGraduationState(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialGraduationState(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialGraduationState(InitialGraduationState value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialGraduationState(InitialGraduationState value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $GraduationStateCopyWith<$Res> {
  factory $GraduationStateCopyWith(
          GraduationState value, $Res Function(GraduationState) then) =
      _$GraduationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GraduationStateCopyWithImpl<$Res>
    implements $GraduationStateCopyWith<$Res> {
  _$GraduationStateCopyWithImpl(this._value, this._then);

  final GraduationState _value;
  // ignore: unused_field
  final $Res Function(GraduationState) _then;
}

/// @nodoc
abstract class $InitialGraduationStateCopyWith<$Res> {
  factory $InitialGraduationStateCopyWith(InitialGraduationState value,
          $Res Function(InitialGraduationState) then) =
      _$InitialGraduationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialGraduationStateCopyWithImpl<$Res>
    extends _$GraduationStateCopyWithImpl<$Res>
    implements $InitialGraduationStateCopyWith<$Res> {
  _$InitialGraduationStateCopyWithImpl(InitialGraduationState _value,
      $Res Function(InitialGraduationState) _then)
      : super(_value, (v) => _then(v as InitialGraduationState));

  @override
  InitialGraduationState get _value => super._value as InitialGraduationState;
}

/// @nodoc
class _$InitialGraduationState
    with DiagnosticableTreeMixin
    implements InitialGraduationState {
  const _$InitialGraduationState();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GraduationState.initialGraduationState()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'GraduationState.initialGraduationState'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitialGraduationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialGraduationState(),
  }) {
    assert(initialGraduationState != null);
    return initialGraduationState();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialGraduationState(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialGraduationState != null) {
      return initialGraduationState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialGraduationState(InitialGraduationState value),
  }) {
    assert(initialGraduationState != null);
    return initialGraduationState(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialGraduationState(InitialGraduationState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialGraduationState != null) {
      return initialGraduationState(this);
    }
    return orElse();
  }
}

abstract class InitialGraduationState implements GraduationState {
  const factory InitialGraduationState() = _$InitialGraduationState;
}
