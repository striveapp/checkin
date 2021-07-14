// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'onboarding_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OnboardingEventTearOff {
  const _$OnboardingEventTearOff();

  InitializeOnboarding initializeOnboarding() {
    return const InitializeOnboarding();
  }

  UserUpdated userUpdated({User? user}) {
    return UserUpdated(
      user: user,
    );
  }
}

/// @nodoc
const $OnboardingEvent = _$OnboardingEventTearOff();

/// @nodoc
mixin _$OnboardingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeOnboarding,
    required TResult Function(User? user) userUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeOnboarding,
    TResult Function(User? user)? userUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeOnboarding value) initializeOnboarding,
    required TResult Function(UserUpdated value) userUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeOnboarding value)? initializeOnboarding,
    TResult Function(UserUpdated value)? userUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingEventCopyWith<$Res> {
  factory $OnboardingEventCopyWith(OnboardingEvent value, $Res Function(OnboardingEvent) then) =
      _$OnboardingEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$OnboardingEventCopyWithImpl<$Res> implements $OnboardingEventCopyWith<$Res> {
  _$OnboardingEventCopyWithImpl(this._value, this._then);

  final OnboardingEvent _value;
  // ignore: unused_field
  final $Res Function(OnboardingEvent) _then;
}

/// @nodoc
abstract class $InitializeOnboardingCopyWith<$Res> {
  factory $InitializeOnboardingCopyWith(
          InitializeOnboarding value, $Res Function(InitializeOnboarding) then) =
      _$InitializeOnboardingCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializeOnboardingCopyWithImpl<$Res> extends _$OnboardingEventCopyWithImpl<$Res>
    implements $InitializeOnboardingCopyWith<$Res> {
  _$InitializeOnboardingCopyWithImpl(
      InitializeOnboarding _value, $Res Function(InitializeOnboarding) _then)
      : super(_value, (v) => _then(v as InitializeOnboarding));

  @override
  InitializeOnboarding get _value => super._value as InitializeOnboarding;
}

/// @nodoc

class _$InitializeOnboarding implements InitializeOnboarding {
  const _$InitializeOnboarding();

  @override
  String toString() {
    return 'OnboardingEvent.initializeOnboarding()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitializeOnboarding);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeOnboarding,
    required TResult Function(User? user) userUpdated,
  }) {
    return initializeOnboarding();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeOnboarding,
    TResult Function(User? user)? userUpdated,
    required TResult orElse(),
  }) {
    if (initializeOnboarding != null) {
      return initializeOnboarding();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeOnboarding value) initializeOnboarding,
    required TResult Function(UserUpdated value) userUpdated,
  }) {
    return initializeOnboarding(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeOnboarding value)? initializeOnboarding,
    TResult Function(UserUpdated value)? userUpdated,
    required TResult orElse(),
  }) {
    if (initializeOnboarding != null) {
      return initializeOnboarding(this);
    }
    return orElse();
  }
}

abstract class InitializeOnboarding implements OnboardingEvent {
  const factory InitializeOnboarding() = _$InitializeOnboarding;
}

/// @nodoc
abstract class $UserUpdatedCopyWith<$Res> {
  factory $UserUpdatedCopyWith(UserUpdated value, $Res Function(UserUpdated) then) =
      _$UserUpdatedCopyWithImpl<$Res>;
  $Res call({User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserUpdatedCopyWithImpl<$Res> extends _$OnboardingEventCopyWithImpl<$Res>
    implements $UserUpdatedCopyWith<$Res> {
  _$UserUpdatedCopyWithImpl(UserUpdated _value, $Res Function(UserUpdated) _then)
      : super(_value, (v) => _then(v as UserUpdated));

  @override
  UserUpdated get _value => super._value as UserUpdated;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(UserUpdated(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$UserUpdated implements UserUpdated {
  const _$UserUpdated({this.user});

  @override
  final User? user;

  @override
  String toString() {
    return 'OnboardingEvent.userUpdated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserUpdated &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(user);

  @JsonKey(ignore: true)
  @override
  $UserUpdatedCopyWith<UserUpdated> get copyWith =>
      _$UserUpdatedCopyWithImpl<UserUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeOnboarding,
    required TResult Function(User? user) userUpdated,
  }) {
    return userUpdated(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeOnboarding,
    TResult Function(User? user)? userUpdated,
    required TResult orElse(),
  }) {
    if (userUpdated != null) {
      return userUpdated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeOnboarding value) initializeOnboarding,
    required TResult Function(UserUpdated value) userUpdated,
  }) {
    return userUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeOnboarding value)? initializeOnboarding,
    TResult Function(UserUpdated value)? userUpdated,
    required TResult orElse(),
  }) {
    if (userUpdated != null) {
      return userUpdated(this);
    }
    return orElse();
  }
}

abstract class UserUpdated implements OnboardingEvent {
  const factory UserUpdated({User? user}) = _$UserUpdated;

  User? get user => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserUpdatedCopyWith<UserUpdated> get copyWith => throw _privateConstructorUsedError;
}
