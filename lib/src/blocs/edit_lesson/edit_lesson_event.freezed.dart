// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'edit_lesson_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EditLessonEventTearOff {
  const _$EditLessonEventTearOff();

  InitializeEditLesson initializeEditLesson() {
    return const InitializeEditLesson();
  }

  MastersUpdated mastersUpdated({required List<Master> masters}) {
    return MastersUpdated(
      masters: masters,
    );
  }

  RetrieveMasters retrieveMasters() {
    return const RetrieveMasters();
  }

  UpdateTimeStart updateTimeStart({required String newTimeStart}) {
    return UpdateTimeStart(
      newTimeStart: newTimeStart,
    );
  }

  UpdateTimeEnd updateTimeEnd({required String newTimeEnd}) {
    return UpdateTimeEnd(
      newTimeEnd: newTimeEnd,
    );
  }

  UpdateName updateName({required String newName}) {
    return UpdateName(
      newName: newName,
    );
  }

  UpdateCapacity updateCapacity({required int newCapacity}) {
    return UpdateCapacity(
      newCapacity: newCapacity,
    );
  }

  UpdateImageUrl updateImageUrl() {
    return const UpdateImageUrl();
  }

  UpdateMasters updateMasters({required List<Master> newMasters}) {
    return UpdateMasters(
      newMasters: newMasters,
    );
  }
}

/// @nodoc
const $EditLessonEvent = _$EditLessonEventTearOff();

/// @nodoc
mixin _$EditLessonEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeEditLesson,
    required TResult Function(List<Master> masters) mastersUpdated,
    required TResult Function() retrieveMasters,
    required TResult Function(String newTimeStart) updateTimeStart,
    required TResult Function(String newTimeEnd) updateTimeEnd,
    required TResult Function(String newName) updateName,
    required TResult Function(int newCapacity) updateCapacity,
    required TResult Function() updateImageUrl,
    required TResult Function(List<Master> newMasters) updateMasters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeEditLesson,
    TResult Function(List<Master> masters)? mastersUpdated,
    TResult Function()? retrieveMasters,
    TResult Function(String newTimeStart)? updateTimeStart,
    TResult Function(String newTimeEnd)? updateTimeEnd,
    TResult Function(String newName)? updateName,
    TResult Function(int newCapacity)? updateCapacity,
    TResult Function()? updateImageUrl,
    TResult Function(List<Master> newMasters)? updateMasters,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeEditLesson value) initializeEditLesson,
    required TResult Function(MastersUpdated value) mastersUpdated,
    required TResult Function(RetrieveMasters value) retrieveMasters,
    required TResult Function(UpdateTimeStart value) updateTimeStart,
    required TResult Function(UpdateTimeEnd value) updateTimeEnd,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateCapacity value) updateCapacity,
    required TResult Function(UpdateImageUrl value) updateImageUrl,
    required TResult Function(UpdateMasters value) updateMasters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeEditLesson value)? initializeEditLesson,
    TResult Function(MastersUpdated value)? mastersUpdated,
    TResult Function(RetrieveMasters value)? retrieveMasters,
    TResult Function(UpdateTimeStart value)? updateTimeStart,
    TResult Function(UpdateTimeEnd value)? updateTimeEnd,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateCapacity value)? updateCapacity,
    TResult Function(UpdateImageUrl value)? updateImageUrl,
    TResult Function(UpdateMasters value)? updateMasters,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditLessonEventCopyWith<$Res> {
  factory $EditLessonEventCopyWith(
          EditLessonEvent value, $Res Function(EditLessonEvent) then) =
      _$EditLessonEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$EditLessonEventCopyWithImpl<$Res>
    implements $EditLessonEventCopyWith<$Res> {
  _$EditLessonEventCopyWithImpl(this._value, this._then);

  final EditLessonEvent _value;
  // ignore: unused_field
  final $Res Function(EditLessonEvent) _then;
}

/// @nodoc
abstract class $InitializeEditLessonCopyWith<$Res> {
  factory $InitializeEditLessonCopyWith(InitializeEditLesson value,
          $Res Function(InitializeEditLesson) then) =
      _$InitializeEditLessonCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializeEditLessonCopyWithImpl<$Res>
    extends _$EditLessonEventCopyWithImpl<$Res>
    implements $InitializeEditLessonCopyWith<$Res> {
  _$InitializeEditLessonCopyWithImpl(
      InitializeEditLesson _value, $Res Function(InitializeEditLesson) _then)
      : super(_value, (v) => _then(v as InitializeEditLesson));

  @override
  InitializeEditLesson get _value => super._value as InitializeEditLesson;
}

/// @nodoc

class _$InitializeEditLesson
    with DiagnosticableTreeMixin
    implements InitializeEditLesson {
  const _$InitializeEditLesson();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditLessonEvent.initializeEditLesson()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'EditLessonEvent.initializeEditLesson'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitializeEditLesson);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeEditLesson,
    required TResult Function(List<Master> masters) mastersUpdated,
    required TResult Function() retrieveMasters,
    required TResult Function(String newTimeStart) updateTimeStart,
    required TResult Function(String newTimeEnd) updateTimeEnd,
    required TResult Function(String newName) updateName,
    required TResult Function(int newCapacity) updateCapacity,
    required TResult Function() updateImageUrl,
    required TResult Function(List<Master> newMasters) updateMasters,
  }) {
    return initializeEditLesson();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeEditLesson,
    TResult Function(List<Master> masters)? mastersUpdated,
    TResult Function()? retrieveMasters,
    TResult Function(String newTimeStart)? updateTimeStart,
    TResult Function(String newTimeEnd)? updateTimeEnd,
    TResult Function(String newName)? updateName,
    TResult Function(int newCapacity)? updateCapacity,
    TResult Function()? updateImageUrl,
    TResult Function(List<Master> newMasters)? updateMasters,
    required TResult orElse(),
  }) {
    if (initializeEditLesson != null) {
      return initializeEditLesson();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeEditLesson value) initializeEditLesson,
    required TResult Function(MastersUpdated value) mastersUpdated,
    required TResult Function(RetrieveMasters value) retrieveMasters,
    required TResult Function(UpdateTimeStart value) updateTimeStart,
    required TResult Function(UpdateTimeEnd value) updateTimeEnd,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateCapacity value) updateCapacity,
    required TResult Function(UpdateImageUrl value) updateImageUrl,
    required TResult Function(UpdateMasters value) updateMasters,
  }) {
    return initializeEditLesson(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeEditLesson value)? initializeEditLesson,
    TResult Function(MastersUpdated value)? mastersUpdated,
    TResult Function(RetrieveMasters value)? retrieveMasters,
    TResult Function(UpdateTimeStart value)? updateTimeStart,
    TResult Function(UpdateTimeEnd value)? updateTimeEnd,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateCapacity value)? updateCapacity,
    TResult Function(UpdateImageUrl value)? updateImageUrl,
    TResult Function(UpdateMasters value)? updateMasters,
    required TResult orElse(),
  }) {
    if (initializeEditLesson != null) {
      return initializeEditLesson(this);
    }
    return orElse();
  }
}

abstract class InitializeEditLesson implements EditLessonEvent {
  const factory InitializeEditLesson() = _$InitializeEditLesson;
}

/// @nodoc
abstract class $MastersUpdatedCopyWith<$Res> {
  factory $MastersUpdatedCopyWith(
          MastersUpdated value, $Res Function(MastersUpdated) then) =
      _$MastersUpdatedCopyWithImpl<$Res>;
  $Res call({List<Master> masters});
}

/// @nodoc
class _$MastersUpdatedCopyWithImpl<$Res>
    extends _$EditLessonEventCopyWithImpl<$Res>
    implements $MastersUpdatedCopyWith<$Res> {
  _$MastersUpdatedCopyWithImpl(
      MastersUpdated _value, $Res Function(MastersUpdated) _then)
      : super(_value, (v) => _then(v as MastersUpdated));

  @override
  MastersUpdated get _value => super._value as MastersUpdated;

  @override
  $Res call({
    Object? masters = freezed,
  }) {
    return _then(MastersUpdated(
      masters: masters == freezed
          ? _value.masters
          : masters // ignore: cast_nullable_to_non_nullable
              as List<Master>,
    ));
  }
}

/// @nodoc

class _$MastersUpdated with DiagnosticableTreeMixin implements MastersUpdated {
  const _$MastersUpdated({required this.masters});

  @override
  final List<Master> masters;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditLessonEvent.mastersUpdated(masters: $masters)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditLessonEvent.mastersUpdated'))
      ..add(DiagnosticsProperty('masters', masters));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MastersUpdated &&
            (identical(other.masters, masters) ||
                const DeepCollectionEquality().equals(other.masters, masters)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(masters);

  @JsonKey(ignore: true)
  @override
  $MastersUpdatedCopyWith<MastersUpdated> get copyWith =>
      _$MastersUpdatedCopyWithImpl<MastersUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeEditLesson,
    required TResult Function(List<Master> masters) mastersUpdated,
    required TResult Function() retrieveMasters,
    required TResult Function(String newTimeStart) updateTimeStart,
    required TResult Function(String newTimeEnd) updateTimeEnd,
    required TResult Function(String newName) updateName,
    required TResult Function(int newCapacity) updateCapacity,
    required TResult Function() updateImageUrl,
    required TResult Function(List<Master> newMasters) updateMasters,
  }) {
    return mastersUpdated(masters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeEditLesson,
    TResult Function(List<Master> masters)? mastersUpdated,
    TResult Function()? retrieveMasters,
    TResult Function(String newTimeStart)? updateTimeStart,
    TResult Function(String newTimeEnd)? updateTimeEnd,
    TResult Function(String newName)? updateName,
    TResult Function(int newCapacity)? updateCapacity,
    TResult Function()? updateImageUrl,
    TResult Function(List<Master> newMasters)? updateMasters,
    required TResult orElse(),
  }) {
    if (mastersUpdated != null) {
      return mastersUpdated(masters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeEditLesson value) initializeEditLesson,
    required TResult Function(MastersUpdated value) mastersUpdated,
    required TResult Function(RetrieveMasters value) retrieveMasters,
    required TResult Function(UpdateTimeStart value) updateTimeStart,
    required TResult Function(UpdateTimeEnd value) updateTimeEnd,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateCapacity value) updateCapacity,
    required TResult Function(UpdateImageUrl value) updateImageUrl,
    required TResult Function(UpdateMasters value) updateMasters,
  }) {
    return mastersUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeEditLesson value)? initializeEditLesson,
    TResult Function(MastersUpdated value)? mastersUpdated,
    TResult Function(RetrieveMasters value)? retrieveMasters,
    TResult Function(UpdateTimeStart value)? updateTimeStart,
    TResult Function(UpdateTimeEnd value)? updateTimeEnd,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateCapacity value)? updateCapacity,
    TResult Function(UpdateImageUrl value)? updateImageUrl,
    TResult Function(UpdateMasters value)? updateMasters,
    required TResult orElse(),
  }) {
    if (mastersUpdated != null) {
      return mastersUpdated(this);
    }
    return orElse();
  }
}

abstract class MastersUpdated implements EditLessonEvent {
  const factory MastersUpdated({required List<Master> masters}) =
      _$MastersUpdated;

  List<Master> get masters => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MastersUpdatedCopyWith<MastersUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RetrieveMastersCopyWith<$Res> {
  factory $RetrieveMastersCopyWith(
          RetrieveMasters value, $Res Function(RetrieveMasters) then) =
      _$RetrieveMastersCopyWithImpl<$Res>;
}

/// @nodoc
class _$RetrieveMastersCopyWithImpl<$Res>
    extends _$EditLessonEventCopyWithImpl<$Res>
    implements $RetrieveMastersCopyWith<$Res> {
  _$RetrieveMastersCopyWithImpl(
      RetrieveMasters _value, $Res Function(RetrieveMasters) _then)
      : super(_value, (v) => _then(v as RetrieveMasters));

  @override
  RetrieveMasters get _value => super._value as RetrieveMasters;
}

/// @nodoc

class _$RetrieveMasters
    with DiagnosticableTreeMixin
    implements RetrieveMasters {
  const _$RetrieveMasters();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditLessonEvent.retrieveMasters()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditLessonEvent.retrieveMasters'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RetrieveMasters);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeEditLesson,
    required TResult Function(List<Master> masters) mastersUpdated,
    required TResult Function() retrieveMasters,
    required TResult Function(String newTimeStart) updateTimeStart,
    required TResult Function(String newTimeEnd) updateTimeEnd,
    required TResult Function(String newName) updateName,
    required TResult Function(int newCapacity) updateCapacity,
    required TResult Function() updateImageUrl,
    required TResult Function(List<Master> newMasters) updateMasters,
  }) {
    return retrieveMasters();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeEditLesson,
    TResult Function(List<Master> masters)? mastersUpdated,
    TResult Function()? retrieveMasters,
    TResult Function(String newTimeStart)? updateTimeStart,
    TResult Function(String newTimeEnd)? updateTimeEnd,
    TResult Function(String newName)? updateName,
    TResult Function(int newCapacity)? updateCapacity,
    TResult Function()? updateImageUrl,
    TResult Function(List<Master> newMasters)? updateMasters,
    required TResult orElse(),
  }) {
    if (retrieveMasters != null) {
      return retrieveMasters();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeEditLesson value) initializeEditLesson,
    required TResult Function(MastersUpdated value) mastersUpdated,
    required TResult Function(RetrieveMasters value) retrieveMasters,
    required TResult Function(UpdateTimeStart value) updateTimeStart,
    required TResult Function(UpdateTimeEnd value) updateTimeEnd,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateCapacity value) updateCapacity,
    required TResult Function(UpdateImageUrl value) updateImageUrl,
    required TResult Function(UpdateMasters value) updateMasters,
  }) {
    return retrieveMasters(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeEditLesson value)? initializeEditLesson,
    TResult Function(MastersUpdated value)? mastersUpdated,
    TResult Function(RetrieveMasters value)? retrieveMasters,
    TResult Function(UpdateTimeStart value)? updateTimeStart,
    TResult Function(UpdateTimeEnd value)? updateTimeEnd,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateCapacity value)? updateCapacity,
    TResult Function(UpdateImageUrl value)? updateImageUrl,
    TResult Function(UpdateMasters value)? updateMasters,
    required TResult orElse(),
  }) {
    if (retrieveMasters != null) {
      return retrieveMasters(this);
    }
    return orElse();
  }
}

abstract class RetrieveMasters implements EditLessonEvent {
  const factory RetrieveMasters() = _$RetrieveMasters;
}

/// @nodoc
abstract class $UpdateTimeStartCopyWith<$Res> {
  factory $UpdateTimeStartCopyWith(
          UpdateTimeStart value, $Res Function(UpdateTimeStart) then) =
      _$UpdateTimeStartCopyWithImpl<$Res>;
  $Res call({String newTimeStart});
}

/// @nodoc
class _$UpdateTimeStartCopyWithImpl<$Res>
    extends _$EditLessonEventCopyWithImpl<$Res>
    implements $UpdateTimeStartCopyWith<$Res> {
  _$UpdateTimeStartCopyWithImpl(
      UpdateTimeStart _value, $Res Function(UpdateTimeStart) _then)
      : super(_value, (v) => _then(v as UpdateTimeStart));

  @override
  UpdateTimeStart get _value => super._value as UpdateTimeStart;

  @override
  $Res call({
    Object? newTimeStart = freezed,
  }) {
    return _then(UpdateTimeStart(
      newTimeStart: newTimeStart == freezed
          ? _value.newTimeStart
          : newTimeStart // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateTimeStart
    with DiagnosticableTreeMixin
    implements UpdateTimeStart {
  const _$UpdateTimeStart({required this.newTimeStart});

  @override
  final String newTimeStart;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditLessonEvent.updateTimeStart(newTimeStart: $newTimeStart)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditLessonEvent.updateTimeStart'))
      ..add(DiagnosticsProperty('newTimeStart', newTimeStart));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateTimeStart &&
            (identical(other.newTimeStart, newTimeStart) ||
                const DeepCollectionEquality()
                    .equals(other.newTimeStart, newTimeStart)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newTimeStart);

  @JsonKey(ignore: true)
  @override
  $UpdateTimeStartCopyWith<UpdateTimeStart> get copyWith =>
      _$UpdateTimeStartCopyWithImpl<UpdateTimeStart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeEditLesson,
    required TResult Function(List<Master> masters) mastersUpdated,
    required TResult Function() retrieveMasters,
    required TResult Function(String newTimeStart) updateTimeStart,
    required TResult Function(String newTimeEnd) updateTimeEnd,
    required TResult Function(String newName) updateName,
    required TResult Function(int newCapacity) updateCapacity,
    required TResult Function() updateImageUrl,
    required TResult Function(List<Master> newMasters) updateMasters,
  }) {
    return updateTimeStart(newTimeStart);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeEditLesson,
    TResult Function(List<Master> masters)? mastersUpdated,
    TResult Function()? retrieveMasters,
    TResult Function(String newTimeStart)? updateTimeStart,
    TResult Function(String newTimeEnd)? updateTimeEnd,
    TResult Function(String newName)? updateName,
    TResult Function(int newCapacity)? updateCapacity,
    TResult Function()? updateImageUrl,
    TResult Function(List<Master> newMasters)? updateMasters,
    required TResult orElse(),
  }) {
    if (updateTimeStart != null) {
      return updateTimeStart(newTimeStart);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeEditLesson value) initializeEditLesson,
    required TResult Function(MastersUpdated value) mastersUpdated,
    required TResult Function(RetrieveMasters value) retrieveMasters,
    required TResult Function(UpdateTimeStart value) updateTimeStart,
    required TResult Function(UpdateTimeEnd value) updateTimeEnd,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateCapacity value) updateCapacity,
    required TResult Function(UpdateImageUrl value) updateImageUrl,
    required TResult Function(UpdateMasters value) updateMasters,
  }) {
    return updateTimeStart(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeEditLesson value)? initializeEditLesson,
    TResult Function(MastersUpdated value)? mastersUpdated,
    TResult Function(RetrieveMasters value)? retrieveMasters,
    TResult Function(UpdateTimeStart value)? updateTimeStart,
    TResult Function(UpdateTimeEnd value)? updateTimeEnd,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateCapacity value)? updateCapacity,
    TResult Function(UpdateImageUrl value)? updateImageUrl,
    TResult Function(UpdateMasters value)? updateMasters,
    required TResult orElse(),
  }) {
    if (updateTimeStart != null) {
      return updateTimeStart(this);
    }
    return orElse();
  }
}

abstract class UpdateTimeStart implements EditLessonEvent {
  const factory UpdateTimeStart({required String newTimeStart}) =
      _$UpdateTimeStart;

  String get newTimeStart => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateTimeStartCopyWith<UpdateTimeStart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTimeEndCopyWith<$Res> {
  factory $UpdateTimeEndCopyWith(
          UpdateTimeEnd value, $Res Function(UpdateTimeEnd) then) =
      _$UpdateTimeEndCopyWithImpl<$Res>;
  $Res call({String newTimeEnd});
}

/// @nodoc
class _$UpdateTimeEndCopyWithImpl<$Res>
    extends _$EditLessonEventCopyWithImpl<$Res>
    implements $UpdateTimeEndCopyWith<$Res> {
  _$UpdateTimeEndCopyWithImpl(
      UpdateTimeEnd _value, $Res Function(UpdateTimeEnd) _then)
      : super(_value, (v) => _then(v as UpdateTimeEnd));

  @override
  UpdateTimeEnd get _value => super._value as UpdateTimeEnd;

  @override
  $Res call({
    Object? newTimeEnd = freezed,
  }) {
    return _then(UpdateTimeEnd(
      newTimeEnd: newTimeEnd == freezed
          ? _value.newTimeEnd
          : newTimeEnd // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateTimeEnd with DiagnosticableTreeMixin implements UpdateTimeEnd {
  const _$UpdateTimeEnd({required this.newTimeEnd});

  @override
  final String newTimeEnd;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditLessonEvent.updateTimeEnd(newTimeEnd: $newTimeEnd)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditLessonEvent.updateTimeEnd'))
      ..add(DiagnosticsProperty('newTimeEnd', newTimeEnd));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateTimeEnd &&
            (identical(other.newTimeEnd, newTimeEnd) ||
                const DeepCollectionEquality()
                    .equals(other.newTimeEnd, newTimeEnd)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newTimeEnd);

  @JsonKey(ignore: true)
  @override
  $UpdateTimeEndCopyWith<UpdateTimeEnd> get copyWith =>
      _$UpdateTimeEndCopyWithImpl<UpdateTimeEnd>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeEditLesson,
    required TResult Function(List<Master> masters) mastersUpdated,
    required TResult Function() retrieveMasters,
    required TResult Function(String newTimeStart) updateTimeStart,
    required TResult Function(String newTimeEnd) updateTimeEnd,
    required TResult Function(String newName) updateName,
    required TResult Function(int newCapacity) updateCapacity,
    required TResult Function() updateImageUrl,
    required TResult Function(List<Master> newMasters) updateMasters,
  }) {
    return updateTimeEnd(newTimeEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeEditLesson,
    TResult Function(List<Master> masters)? mastersUpdated,
    TResult Function()? retrieveMasters,
    TResult Function(String newTimeStart)? updateTimeStart,
    TResult Function(String newTimeEnd)? updateTimeEnd,
    TResult Function(String newName)? updateName,
    TResult Function(int newCapacity)? updateCapacity,
    TResult Function()? updateImageUrl,
    TResult Function(List<Master> newMasters)? updateMasters,
    required TResult orElse(),
  }) {
    if (updateTimeEnd != null) {
      return updateTimeEnd(newTimeEnd);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeEditLesson value) initializeEditLesson,
    required TResult Function(MastersUpdated value) mastersUpdated,
    required TResult Function(RetrieveMasters value) retrieveMasters,
    required TResult Function(UpdateTimeStart value) updateTimeStart,
    required TResult Function(UpdateTimeEnd value) updateTimeEnd,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateCapacity value) updateCapacity,
    required TResult Function(UpdateImageUrl value) updateImageUrl,
    required TResult Function(UpdateMasters value) updateMasters,
  }) {
    return updateTimeEnd(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeEditLesson value)? initializeEditLesson,
    TResult Function(MastersUpdated value)? mastersUpdated,
    TResult Function(RetrieveMasters value)? retrieveMasters,
    TResult Function(UpdateTimeStart value)? updateTimeStart,
    TResult Function(UpdateTimeEnd value)? updateTimeEnd,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateCapacity value)? updateCapacity,
    TResult Function(UpdateImageUrl value)? updateImageUrl,
    TResult Function(UpdateMasters value)? updateMasters,
    required TResult orElse(),
  }) {
    if (updateTimeEnd != null) {
      return updateTimeEnd(this);
    }
    return orElse();
  }
}

abstract class UpdateTimeEnd implements EditLessonEvent {
  const factory UpdateTimeEnd({required String newTimeEnd}) = _$UpdateTimeEnd;

  String get newTimeEnd => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateTimeEndCopyWith<UpdateTimeEnd> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateNameCopyWith<$Res> {
  factory $UpdateNameCopyWith(
          UpdateName value, $Res Function(UpdateName) then) =
      _$UpdateNameCopyWithImpl<$Res>;
  $Res call({String newName});
}

/// @nodoc
class _$UpdateNameCopyWithImpl<$Res> extends _$EditLessonEventCopyWithImpl<$Res>
    implements $UpdateNameCopyWith<$Res> {
  _$UpdateNameCopyWithImpl(UpdateName _value, $Res Function(UpdateName) _then)
      : super(_value, (v) => _then(v as UpdateName));

  @override
  UpdateName get _value => super._value as UpdateName;

  @override
  $Res call({
    Object? newName = freezed,
  }) {
    return _then(UpdateName(
      newName: newName == freezed
          ? _value.newName
          : newName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateName with DiagnosticableTreeMixin implements UpdateName {
  const _$UpdateName({required this.newName});

  @override
  final String newName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditLessonEvent.updateName(newName: $newName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditLessonEvent.updateName'))
      ..add(DiagnosticsProperty('newName', newName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateName &&
            (identical(other.newName, newName) ||
                const DeepCollectionEquality().equals(other.newName, newName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newName);

  @JsonKey(ignore: true)
  @override
  $UpdateNameCopyWith<UpdateName> get copyWith =>
      _$UpdateNameCopyWithImpl<UpdateName>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeEditLesson,
    required TResult Function(List<Master> masters) mastersUpdated,
    required TResult Function() retrieveMasters,
    required TResult Function(String newTimeStart) updateTimeStart,
    required TResult Function(String newTimeEnd) updateTimeEnd,
    required TResult Function(String newName) updateName,
    required TResult Function(int newCapacity) updateCapacity,
    required TResult Function() updateImageUrl,
    required TResult Function(List<Master> newMasters) updateMasters,
  }) {
    return updateName(newName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeEditLesson,
    TResult Function(List<Master> masters)? mastersUpdated,
    TResult Function()? retrieveMasters,
    TResult Function(String newTimeStart)? updateTimeStart,
    TResult Function(String newTimeEnd)? updateTimeEnd,
    TResult Function(String newName)? updateName,
    TResult Function(int newCapacity)? updateCapacity,
    TResult Function()? updateImageUrl,
    TResult Function(List<Master> newMasters)? updateMasters,
    required TResult orElse(),
  }) {
    if (updateName != null) {
      return updateName(newName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeEditLesson value) initializeEditLesson,
    required TResult Function(MastersUpdated value) mastersUpdated,
    required TResult Function(RetrieveMasters value) retrieveMasters,
    required TResult Function(UpdateTimeStart value) updateTimeStart,
    required TResult Function(UpdateTimeEnd value) updateTimeEnd,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateCapacity value) updateCapacity,
    required TResult Function(UpdateImageUrl value) updateImageUrl,
    required TResult Function(UpdateMasters value) updateMasters,
  }) {
    return updateName(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeEditLesson value)? initializeEditLesson,
    TResult Function(MastersUpdated value)? mastersUpdated,
    TResult Function(RetrieveMasters value)? retrieveMasters,
    TResult Function(UpdateTimeStart value)? updateTimeStart,
    TResult Function(UpdateTimeEnd value)? updateTimeEnd,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateCapacity value)? updateCapacity,
    TResult Function(UpdateImageUrl value)? updateImageUrl,
    TResult Function(UpdateMasters value)? updateMasters,
    required TResult orElse(),
  }) {
    if (updateName != null) {
      return updateName(this);
    }
    return orElse();
  }
}

abstract class UpdateName implements EditLessonEvent {
  const factory UpdateName({required String newName}) = _$UpdateName;

  String get newName => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateNameCopyWith<UpdateName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateCapacityCopyWith<$Res> {
  factory $UpdateCapacityCopyWith(
          UpdateCapacity value, $Res Function(UpdateCapacity) then) =
      _$UpdateCapacityCopyWithImpl<$Res>;
  $Res call({int newCapacity});
}

/// @nodoc
class _$UpdateCapacityCopyWithImpl<$Res>
    extends _$EditLessonEventCopyWithImpl<$Res>
    implements $UpdateCapacityCopyWith<$Res> {
  _$UpdateCapacityCopyWithImpl(
      UpdateCapacity _value, $Res Function(UpdateCapacity) _then)
      : super(_value, (v) => _then(v as UpdateCapacity));

  @override
  UpdateCapacity get _value => super._value as UpdateCapacity;

  @override
  $Res call({
    Object? newCapacity = freezed,
  }) {
    return _then(UpdateCapacity(
      newCapacity: newCapacity == freezed
          ? _value.newCapacity
          : newCapacity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpdateCapacity with DiagnosticableTreeMixin implements UpdateCapacity {
  const _$UpdateCapacity({required this.newCapacity});

  @override
  final int newCapacity;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditLessonEvent.updateCapacity(newCapacity: $newCapacity)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditLessonEvent.updateCapacity'))
      ..add(DiagnosticsProperty('newCapacity', newCapacity));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateCapacity &&
            (identical(other.newCapacity, newCapacity) ||
                const DeepCollectionEquality()
                    .equals(other.newCapacity, newCapacity)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newCapacity);

  @JsonKey(ignore: true)
  @override
  $UpdateCapacityCopyWith<UpdateCapacity> get copyWith =>
      _$UpdateCapacityCopyWithImpl<UpdateCapacity>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeEditLesson,
    required TResult Function(List<Master> masters) mastersUpdated,
    required TResult Function() retrieveMasters,
    required TResult Function(String newTimeStart) updateTimeStart,
    required TResult Function(String newTimeEnd) updateTimeEnd,
    required TResult Function(String newName) updateName,
    required TResult Function(int newCapacity) updateCapacity,
    required TResult Function() updateImageUrl,
    required TResult Function(List<Master> newMasters) updateMasters,
  }) {
    return updateCapacity(newCapacity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeEditLesson,
    TResult Function(List<Master> masters)? mastersUpdated,
    TResult Function()? retrieveMasters,
    TResult Function(String newTimeStart)? updateTimeStart,
    TResult Function(String newTimeEnd)? updateTimeEnd,
    TResult Function(String newName)? updateName,
    TResult Function(int newCapacity)? updateCapacity,
    TResult Function()? updateImageUrl,
    TResult Function(List<Master> newMasters)? updateMasters,
    required TResult orElse(),
  }) {
    if (updateCapacity != null) {
      return updateCapacity(newCapacity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeEditLesson value) initializeEditLesson,
    required TResult Function(MastersUpdated value) mastersUpdated,
    required TResult Function(RetrieveMasters value) retrieveMasters,
    required TResult Function(UpdateTimeStart value) updateTimeStart,
    required TResult Function(UpdateTimeEnd value) updateTimeEnd,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateCapacity value) updateCapacity,
    required TResult Function(UpdateImageUrl value) updateImageUrl,
    required TResult Function(UpdateMasters value) updateMasters,
  }) {
    return updateCapacity(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeEditLesson value)? initializeEditLesson,
    TResult Function(MastersUpdated value)? mastersUpdated,
    TResult Function(RetrieveMasters value)? retrieveMasters,
    TResult Function(UpdateTimeStart value)? updateTimeStart,
    TResult Function(UpdateTimeEnd value)? updateTimeEnd,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateCapacity value)? updateCapacity,
    TResult Function(UpdateImageUrl value)? updateImageUrl,
    TResult Function(UpdateMasters value)? updateMasters,
    required TResult orElse(),
  }) {
    if (updateCapacity != null) {
      return updateCapacity(this);
    }
    return orElse();
  }
}

abstract class UpdateCapacity implements EditLessonEvent {
  const factory UpdateCapacity({required int newCapacity}) = _$UpdateCapacity;

  int get newCapacity => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateCapacityCopyWith<UpdateCapacity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateImageUrlCopyWith<$Res> {
  factory $UpdateImageUrlCopyWith(
          UpdateImageUrl value, $Res Function(UpdateImageUrl) then) =
      _$UpdateImageUrlCopyWithImpl<$Res>;
}

/// @nodoc
class _$UpdateImageUrlCopyWithImpl<$Res>
    extends _$EditLessonEventCopyWithImpl<$Res>
    implements $UpdateImageUrlCopyWith<$Res> {
  _$UpdateImageUrlCopyWithImpl(
      UpdateImageUrl _value, $Res Function(UpdateImageUrl) _then)
      : super(_value, (v) => _then(v as UpdateImageUrl));

  @override
  UpdateImageUrl get _value => super._value as UpdateImageUrl;
}

/// @nodoc

class _$UpdateImageUrl with DiagnosticableTreeMixin implements UpdateImageUrl {
  const _$UpdateImageUrl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditLessonEvent.updateImageUrl()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditLessonEvent.updateImageUrl'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UpdateImageUrl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeEditLesson,
    required TResult Function(List<Master> masters) mastersUpdated,
    required TResult Function() retrieveMasters,
    required TResult Function(String newTimeStart) updateTimeStart,
    required TResult Function(String newTimeEnd) updateTimeEnd,
    required TResult Function(String newName) updateName,
    required TResult Function(int newCapacity) updateCapacity,
    required TResult Function() updateImageUrl,
    required TResult Function(List<Master> newMasters) updateMasters,
  }) {
    return updateImageUrl();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeEditLesson,
    TResult Function(List<Master> masters)? mastersUpdated,
    TResult Function()? retrieveMasters,
    TResult Function(String newTimeStart)? updateTimeStart,
    TResult Function(String newTimeEnd)? updateTimeEnd,
    TResult Function(String newName)? updateName,
    TResult Function(int newCapacity)? updateCapacity,
    TResult Function()? updateImageUrl,
    TResult Function(List<Master> newMasters)? updateMasters,
    required TResult orElse(),
  }) {
    if (updateImageUrl != null) {
      return updateImageUrl();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeEditLesson value) initializeEditLesson,
    required TResult Function(MastersUpdated value) mastersUpdated,
    required TResult Function(RetrieveMasters value) retrieveMasters,
    required TResult Function(UpdateTimeStart value) updateTimeStart,
    required TResult Function(UpdateTimeEnd value) updateTimeEnd,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateCapacity value) updateCapacity,
    required TResult Function(UpdateImageUrl value) updateImageUrl,
    required TResult Function(UpdateMasters value) updateMasters,
  }) {
    return updateImageUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeEditLesson value)? initializeEditLesson,
    TResult Function(MastersUpdated value)? mastersUpdated,
    TResult Function(RetrieveMasters value)? retrieveMasters,
    TResult Function(UpdateTimeStart value)? updateTimeStart,
    TResult Function(UpdateTimeEnd value)? updateTimeEnd,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateCapacity value)? updateCapacity,
    TResult Function(UpdateImageUrl value)? updateImageUrl,
    TResult Function(UpdateMasters value)? updateMasters,
    required TResult orElse(),
  }) {
    if (updateImageUrl != null) {
      return updateImageUrl(this);
    }
    return orElse();
  }
}

abstract class UpdateImageUrl implements EditLessonEvent {
  const factory UpdateImageUrl() = _$UpdateImageUrl;
}

/// @nodoc
abstract class $UpdateMastersCopyWith<$Res> {
  factory $UpdateMastersCopyWith(
          UpdateMasters value, $Res Function(UpdateMasters) then) =
      _$UpdateMastersCopyWithImpl<$Res>;
  $Res call({List<Master> newMasters});
}

/// @nodoc
class _$UpdateMastersCopyWithImpl<$Res>
    extends _$EditLessonEventCopyWithImpl<$Res>
    implements $UpdateMastersCopyWith<$Res> {
  _$UpdateMastersCopyWithImpl(
      UpdateMasters _value, $Res Function(UpdateMasters) _then)
      : super(_value, (v) => _then(v as UpdateMasters));

  @override
  UpdateMasters get _value => super._value as UpdateMasters;

  @override
  $Res call({
    Object? newMasters = freezed,
  }) {
    return _then(UpdateMasters(
      newMasters: newMasters == freezed
          ? _value.newMasters
          : newMasters // ignore: cast_nullable_to_non_nullable
              as List<Master>,
    ));
  }
}

/// @nodoc

class _$UpdateMasters with DiagnosticableTreeMixin implements UpdateMasters {
  const _$UpdateMasters({required this.newMasters});

  @override
  final List<Master> newMasters;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EditLessonEvent.updateMasters(newMasters: $newMasters)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EditLessonEvent.updateMasters'))
      ..add(DiagnosticsProperty('newMasters', newMasters));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateMasters &&
            (identical(other.newMasters, newMasters) ||
                const DeepCollectionEquality()
                    .equals(other.newMasters, newMasters)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newMasters);

  @JsonKey(ignore: true)
  @override
  $UpdateMastersCopyWith<UpdateMasters> get copyWith =>
      _$UpdateMastersCopyWithImpl<UpdateMasters>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeEditLesson,
    required TResult Function(List<Master> masters) mastersUpdated,
    required TResult Function() retrieveMasters,
    required TResult Function(String newTimeStart) updateTimeStart,
    required TResult Function(String newTimeEnd) updateTimeEnd,
    required TResult Function(String newName) updateName,
    required TResult Function(int newCapacity) updateCapacity,
    required TResult Function() updateImageUrl,
    required TResult Function(List<Master> newMasters) updateMasters,
  }) {
    return updateMasters(newMasters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeEditLesson,
    TResult Function(List<Master> masters)? mastersUpdated,
    TResult Function()? retrieveMasters,
    TResult Function(String newTimeStart)? updateTimeStart,
    TResult Function(String newTimeEnd)? updateTimeEnd,
    TResult Function(String newName)? updateName,
    TResult Function(int newCapacity)? updateCapacity,
    TResult Function()? updateImageUrl,
    TResult Function(List<Master> newMasters)? updateMasters,
    required TResult orElse(),
  }) {
    if (updateMasters != null) {
      return updateMasters(newMasters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeEditLesson value) initializeEditLesson,
    required TResult Function(MastersUpdated value) mastersUpdated,
    required TResult Function(RetrieveMasters value) retrieveMasters,
    required TResult Function(UpdateTimeStart value) updateTimeStart,
    required TResult Function(UpdateTimeEnd value) updateTimeEnd,
    required TResult Function(UpdateName value) updateName,
    required TResult Function(UpdateCapacity value) updateCapacity,
    required TResult Function(UpdateImageUrl value) updateImageUrl,
    required TResult Function(UpdateMasters value) updateMasters,
  }) {
    return updateMasters(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeEditLesson value)? initializeEditLesson,
    TResult Function(MastersUpdated value)? mastersUpdated,
    TResult Function(RetrieveMasters value)? retrieveMasters,
    TResult Function(UpdateTimeStart value)? updateTimeStart,
    TResult Function(UpdateTimeEnd value)? updateTimeEnd,
    TResult Function(UpdateName value)? updateName,
    TResult Function(UpdateCapacity value)? updateCapacity,
    TResult Function(UpdateImageUrl value)? updateImageUrl,
    TResult Function(UpdateMasters value)? updateMasters,
    required TResult orElse(),
  }) {
    if (updateMasters != null) {
      return updateMasters(this);
    }
    return orElse();
  }
}

abstract class UpdateMasters implements EditLessonEvent {
  const factory UpdateMasters({required List<Master> newMasters}) =
      _$UpdateMasters;

  List<Master> get newMasters => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateMastersCopyWith<UpdateMasters> get copyWith =>
      throw _privateConstructorUsedError;
}
