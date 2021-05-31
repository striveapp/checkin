// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'edit_lesson_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$EditLessonStateTearOff {
  const _$EditLessonStateTearOff();

// ignore: unused_element
  EditLessonUninitialized editLessonUninitialized() {
    return const EditLessonUninitialized();
  }

// ignore: unused_element
  MastersLoaded mastersLoaded({@required List<Master> masters}) {
    return MastersLoaded(
      masters: masters,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $EditLessonState = _$EditLessonStateTearOff();

/// @nodoc
mixin _$EditLessonState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult editLessonUninitialized(),
    @required TResult mastersLoaded(List<Master> masters),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult editLessonUninitialized(),
    TResult mastersLoaded(List<Master> masters),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult editLessonUninitialized(EditLessonUninitialized value),
    @required TResult mastersLoaded(MastersLoaded value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult editLessonUninitialized(EditLessonUninitialized value),
    TResult mastersLoaded(MastersLoaded value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $EditLessonStateCopyWith<$Res> {
  factory $EditLessonStateCopyWith(EditLessonState value, $Res Function(EditLessonState) then) =
      _$EditLessonStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$EditLessonStateCopyWithImpl<$Res> implements $EditLessonStateCopyWith<$Res> {
  _$EditLessonStateCopyWithImpl(this._value, this._then);

  final EditLessonState _value;
  // ignore: unused_field
  final $Res Function(EditLessonState) _then;
}

/// @nodoc
abstract class $EditLessonUninitializedCopyWith<$Res> {
  factory $EditLessonUninitializedCopyWith(
          EditLessonUninitialized value, $Res Function(EditLessonUninitialized) then) =
      _$EditLessonUninitializedCopyWithImpl<$Res>;
}

/// @nodoc
class _$EditLessonUninitializedCopyWithImpl<$Res> extends _$EditLessonStateCopyWithImpl<$Res>
    implements $EditLessonUninitializedCopyWith<$Res> {
  _$EditLessonUninitializedCopyWithImpl(
      EditLessonUninitialized _value, $Res Function(EditLessonUninitialized) _then)
      : super(_value, (v) => _then(v as EditLessonUninitialized));

  @override
  EditLessonUninitialized get _value => super._value as EditLessonUninitialized;
}

/// @nodoc
class _$EditLessonUninitialized with DiagnosticableTreeMixin implements EditLessonUninitialized {
  const _$EditLessonUninitialized();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditLessonState.editLessonUninitialized()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'EditLessonState.editLessonUninitialized'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EditLessonUninitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult editLessonUninitialized(),
    @required TResult mastersLoaded(List<Master> masters),
  }) {
    assert(editLessonUninitialized != null);
    assert(mastersLoaded != null);
    return editLessonUninitialized();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult editLessonUninitialized(),
    TResult mastersLoaded(List<Master> masters),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (editLessonUninitialized != null) {
      return editLessonUninitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult editLessonUninitialized(EditLessonUninitialized value),
    @required TResult mastersLoaded(MastersLoaded value),
  }) {
    assert(editLessonUninitialized != null);
    assert(mastersLoaded != null);
    return editLessonUninitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult editLessonUninitialized(EditLessonUninitialized value),
    TResult mastersLoaded(MastersLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (editLessonUninitialized != null) {
      return editLessonUninitialized(this);
    }
    return orElse();
  }
}

abstract class EditLessonUninitialized implements EditLessonState {
  const factory EditLessonUninitialized() = _$EditLessonUninitialized;
}

/// @nodoc
abstract class $MastersLoadedCopyWith<$Res> {
  factory $MastersLoadedCopyWith(MastersLoaded value, $Res Function(MastersLoaded) then) =
      _$MastersLoadedCopyWithImpl<$Res>;
  $Res call({List<Master> masters});
}

/// @nodoc
class _$MastersLoadedCopyWithImpl<$Res> extends _$EditLessonStateCopyWithImpl<$Res>
    implements $MastersLoadedCopyWith<$Res> {
  _$MastersLoadedCopyWithImpl(MastersLoaded _value, $Res Function(MastersLoaded) _then)
      : super(_value, (v) => _then(v as MastersLoaded));

  @override
  MastersLoaded get _value => super._value as MastersLoaded;

  @override
  $Res call({
    Object masters = freezed,
  }) {
    return _then(MastersLoaded(
      masters: masters == freezed ? _value.masters : masters as List<Master>,
    ));
  }
}

/// @nodoc
class _$MastersLoaded with DiagnosticableTreeMixin implements MastersLoaded {
  const _$MastersLoaded({@required this.masters}) : assert(masters != null);

  @override
  final List<Master> masters;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditLessonState.mastersLoaded(masters: $masters)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditLessonState.mastersLoaded'))
      ..add(DiagnosticsProperty('masters', masters));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MastersLoaded &&
            (identical(other.masters, masters) ||
                const DeepCollectionEquality().equals(other.masters, masters)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(masters);

  @JsonKey(ignore: true)
  @override
  $MastersLoadedCopyWith<MastersLoaded> get copyWith =>
      _$MastersLoadedCopyWithImpl<MastersLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult editLessonUninitialized(),
    @required TResult mastersLoaded(List<Master> masters),
  }) {
    assert(editLessonUninitialized != null);
    assert(mastersLoaded != null);
    return mastersLoaded(masters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult editLessonUninitialized(),
    TResult mastersLoaded(List<Master> masters),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (mastersLoaded != null) {
      return mastersLoaded(masters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult editLessonUninitialized(EditLessonUninitialized value),
    @required TResult mastersLoaded(MastersLoaded value),
  }) {
    assert(editLessonUninitialized != null);
    assert(mastersLoaded != null);
    return mastersLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult editLessonUninitialized(EditLessonUninitialized value),
    TResult mastersLoaded(MastersLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (mastersLoaded != null) {
      return mastersLoaded(this);
    }
    return orElse();
  }
}

abstract class MastersLoaded implements EditLessonState {
  const factory MastersLoaded({@required List<Master> masters}) = _$MastersLoaded;

  List<Master> get masters;
  @JsonKey(ignore: true)
  $MastersLoadedCopyWith<MastersLoaded> get copyWith;
}
