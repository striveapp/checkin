// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'switch_gym_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SwitchGymsStateTearOff {
  const _$SwitchGymsStateTearOff();

// ignore: unused_element
  SwitchGymsInitial switchGymsInitial() {
    return const SwitchGymsInitial();
  }

// ignore: unused_element
  KnownGymsLoaded knownGymsLoaded(
      {@required Gym selectedGym,
      @required User currentUser,
      @required List<String> knowGymsIds,
      bool showDropdown = false}) {
    return KnownGymsLoaded(
      selectedGym: selectedGym,
      currentUser: currentUser,
      knowGymsIds: knowGymsIds,
      showDropdown: showDropdown,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SwitchGymsState = _$SwitchGymsStateTearOff();

/// @nodoc
mixin _$SwitchGymsState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult switchGymsInitial(),
    @required
        TResult knownGymsLoaded(
            Gym selectedGym, User currentUser, List<String> knowGymsIds, bool showDropdown),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult switchGymsInitial(),
    TResult knownGymsLoaded(
        Gym selectedGym, User currentUser, List<String> knowGymsIds, bool showDropdown),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult switchGymsInitial(SwitchGymsInitial value),
    @required TResult knownGymsLoaded(KnownGymsLoaded value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult switchGymsInitial(SwitchGymsInitial value),
    TResult knownGymsLoaded(KnownGymsLoaded value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $SwitchGymsStateCopyWith<$Res> {
  factory $SwitchGymsStateCopyWith(SwitchGymsState value, $Res Function(SwitchGymsState) then) =
      _$SwitchGymsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SwitchGymsStateCopyWithImpl<$Res> implements $SwitchGymsStateCopyWith<$Res> {
  _$SwitchGymsStateCopyWithImpl(this._value, this._then);

  final SwitchGymsState _value;
  // ignore: unused_field
  final $Res Function(SwitchGymsState) _then;
}

/// @nodoc
abstract class $SwitchGymsInitialCopyWith<$Res> {
  factory $SwitchGymsInitialCopyWith(
          SwitchGymsInitial value, $Res Function(SwitchGymsInitial) then) =
      _$SwitchGymsInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$SwitchGymsInitialCopyWithImpl<$Res> extends _$SwitchGymsStateCopyWithImpl<$Res>
    implements $SwitchGymsInitialCopyWith<$Res> {
  _$SwitchGymsInitialCopyWithImpl(SwitchGymsInitial _value, $Res Function(SwitchGymsInitial) _then)
      : super(_value, (v) => _then(v as SwitchGymsInitial));

  @override
  SwitchGymsInitial get _value => super._value as SwitchGymsInitial;
}

/// @nodoc
class _$SwitchGymsInitial implements SwitchGymsInitial {
  const _$SwitchGymsInitial();

  @override
  String toString() {
    return 'SwitchGymsState.switchGymsInitial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SwitchGymsInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult switchGymsInitial(),
    @required
        TResult knownGymsLoaded(
            Gym selectedGym, User currentUser, List<String> knowGymsIds, bool showDropdown),
  }) {
    assert(switchGymsInitial != null);
    assert(knownGymsLoaded != null);
    return switchGymsInitial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult switchGymsInitial(),
    TResult knownGymsLoaded(
        Gym selectedGym, User currentUser, List<String> knowGymsIds, bool showDropdown),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (switchGymsInitial != null) {
      return switchGymsInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult switchGymsInitial(SwitchGymsInitial value),
    @required TResult knownGymsLoaded(KnownGymsLoaded value),
  }) {
    assert(switchGymsInitial != null);
    assert(knownGymsLoaded != null);
    return switchGymsInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult switchGymsInitial(SwitchGymsInitial value),
    TResult knownGymsLoaded(KnownGymsLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (switchGymsInitial != null) {
      return switchGymsInitial(this);
    }
    return orElse();
  }
}

abstract class SwitchGymsInitial implements SwitchGymsState {
  const factory SwitchGymsInitial() = _$SwitchGymsInitial;
}

/// @nodoc
abstract class $KnownGymsLoadedCopyWith<$Res> {
  factory $KnownGymsLoadedCopyWith(KnownGymsLoaded value, $Res Function(KnownGymsLoaded) then) =
      _$KnownGymsLoadedCopyWithImpl<$Res>;
  $Res call({Gym selectedGym, User currentUser, List<String> knowGymsIds, bool showDropdown});

  $GymCopyWith<$Res> get selectedGym;
  $UserCopyWith<$Res> get currentUser;
}

/// @nodoc
class _$KnownGymsLoadedCopyWithImpl<$Res> extends _$SwitchGymsStateCopyWithImpl<$Res>
    implements $KnownGymsLoadedCopyWith<$Res> {
  _$KnownGymsLoadedCopyWithImpl(KnownGymsLoaded _value, $Res Function(KnownGymsLoaded) _then)
      : super(_value, (v) => _then(v as KnownGymsLoaded));

  @override
  KnownGymsLoaded get _value => super._value as KnownGymsLoaded;

  @override
  $Res call({
    Object selectedGym = freezed,
    Object currentUser = freezed,
    Object knowGymsIds = freezed,
    Object showDropdown = freezed,
  }) {
    return _then(KnownGymsLoaded(
      selectedGym: selectedGym == freezed ? _value.selectedGym : selectedGym as Gym,
      currentUser: currentUser == freezed ? _value.currentUser : currentUser as User,
      knowGymsIds: knowGymsIds == freezed ? _value.knowGymsIds : knowGymsIds as List<String>,
      showDropdown: showDropdown == freezed ? _value.showDropdown : showDropdown as bool,
    ));
  }

  @override
  $GymCopyWith<$Res> get selectedGym {
    if (_value.selectedGym == null) {
      return null;
    }
    return $GymCopyWith<$Res>(_value.selectedGym, (value) {
      return _then(_value.copyWith(selectedGym: value));
    });
  }

  @override
  $UserCopyWith<$Res> get currentUser {
    if (_value.currentUser == null) {
      return null;
    }
    return $UserCopyWith<$Res>(_value.currentUser, (value) {
      return _then(_value.copyWith(currentUser: value));
    });
  }
}

/// @nodoc
class _$KnownGymsLoaded implements KnownGymsLoaded {
  const _$KnownGymsLoaded(
      {@required this.selectedGym,
      @required this.currentUser,
      @required this.knowGymsIds,
      this.showDropdown = false})
      : assert(selectedGym != null),
        assert(currentUser != null),
        assert(knowGymsIds != null),
        assert(showDropdown != null);

  @override
  final Gym selectedGym;
  @override
  final User currentUser;
  @override
  final List<String> knowGymsIds;
  @JsonKey(defaultValue: false)
  @override
  final bool showDropdown;

  @override
  String toString() {
    return 'SwitchGymsState.knownGymsLoaded(selectedGym: $selectedGym, currentUser: $currentUser, knowGymsIds: $knowGymsIds, showDropdown: $showDropdown)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KnownGymsLoaded &&
            (identical(other.selectedGym, selectedGym) ||
                const DeepCollectionEquality().equals(other.selectedGym, selectedGym)) &&
            (identical(other.currentUser, currentUser) ||
                const DeepCollectionEquality().equals(other.currentUser, currentUser)) &&
            (identical(other.knowGymsIds, knowGymsIds) ||
                const DeepCollectionEquality().equals(other.knowGymsIds, knowGymsIds)) &&
            (identical(other.showDropdown, showDropdown) ||
                const DeepCollectionEquality().equals(other.showDropdown, showDropdown)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectedGym) ^
      const DeepCollectionEquality().hash(currentUser) ^
      const DeepCollectionEquality().hash(knowGymsIds) ^
      const DeepCollectionEquality().hash(showDropdown);

  @JsonKey(ignore: true)
  @override
  $KnownGymsLoadedCopyWith<KnownGymsLoaded> get copyWith =>
      _$KnownGymsLoadedCopyWithImpl<KnownGymsLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult switchGymsInitial(),
    @required
        TResult knownGymsLoaded(
            Gym selectedGym, User currentUser, List<String> knowGymsIds, bool showDropdown),
  }) {
    assert(switchGymsInitial != null);
    assert(knownGymsLoaded != null);
    return knownGymsLoaded(selectedGym, currentUser, knowGymsIds, showDropdown);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult switchGymsInitial(),
    TResult knownGymsLoaded(
        Gym selectedGym, User currentUser, List<String> knowGymsIds, bool showDropdown),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (knownGymsLoaded != null) {
      return knownGymsLoaded(selectedGym, currentUser, knowGymsIds, showDropdown);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult switchGymsInitial(SwitchGymsInitial value),
    @required TResult knownGymsLoaded(KnownGymsLoaded value),
  }) {
    assert(switchGymsInitial != null);
    assert(knownGymsLoaded != null);
    return knownGymsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult switchGymsInitial(SwitchGymsInitial value),
    TResult knownGymsLoaded(KnownGymsLoaded value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (knownGymsLoaded != null) {
      return knownGymsLoaded(this);
    }
    return orElse();
  }
}

abstract class KnownGymsLoaded implements SwitchGymsState {
  const factory KnownGymsLoaded(
      {@required Gym selectedGym,
      @required User currentUser,
      @required List<String> knowGymsIds,
      bool showDropdown}) = _$KnownGymsLoaded;

  Gym get selectedGym;
  User get currentUser;
  List<String> get knowGymsIds;
  bool get showDropdown;
  @JsonKey(ignore: true)
  $KnownGymsLoadedCopyWith<KnownGymsLoaded> get copyWith;
}
