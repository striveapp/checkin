// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'membership.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$MembershipTearOff {
  const _$MembershipTearOff();

  CardMembership cardMembership(
      {@required String status,
      @required int currentPeriodEnd,
      @required String email,
      @required String lastFourDigits,
      @required String country}) {
    return CardMembership(
      status: status,
      currentPeriodEnd: currentPeriodEnd,
      email: email,
      lastFourDigits: lastFourDigits,
      country: country,
    );
  }

  SepaMembership sepaMembership(
      {@required String status,
      @required int currentPeriodEnd,
      @required String email,
      @required String lastFourDigits,
      @required String country}) {
    return SepaMembership(
      status: status,
      currentPeriodEnd: currentPeriodEnd,
      email: email,
      lastFourDigits: lastFourDigits,
      country: country,
    );
  }
}

// ignore: unused_element
const $Membership = _$MembershipTearOff();

mixin _$Membership {
  String get status;
  int get currentPeriodEnd;
  String get email;
  String get lastFourDigits;
  String get country;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result cardMembership(String status, int currentPeriodEnd, String email,
            String lastFourDigits, String country),
    @required
        Result sepaMembership(String status, int currentPeriodEnd, String email,
            String lastFourDigits, String country),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cardMembership(String status, int currentPeriodEnd, String email,
        String lastFourDigits, String country),
    Result sepaMembership(String status, int currentPeriodEnd, String email,
        String lastFourDigits, String country),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cardMembership(CardMembership value),
    @required Result sepaMembership(SepaMembership value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cardMembership(CardMembership value),
    Result sepaMembership(SepaMembership value),
    @required Result orElse(),
  });

  $MembershipCopyWith<Membership> get copyWith;
}

abstract class $MembershipCopyWith<$Res> {
  factory $MembershipCopyWith(
          Membership value, $Res Function(Membership) then) =
      _$MembershipCopyWithImpl<$Res>;
  $Res call(
      {String status,
      int currentPeriodEnd,
      String email,
      String lastFourDigits,
      String country});
}

class _$MembershipCopyWithImpl<$Res> implements $MembershipCopyWith<$Res> {
  _$MembershipCopyWithImpl(this._value, this._then);

  final Membership _value;
  // ignore: unused_field
  final $Res Function(Membership) _then;

  @override
  $Res call({
    Object status = freezed,
    Object currentPeriodEnd = freezed,
    Object email = freezed,
    Object lastFourDigits = freezed,
    Object country = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed ? _value.status : status as String,
      currentPeriodEnd: currentPeriodEnd == freezed
          ? _value.currentPeriodEnd
          : currentPeriodEnd as int,
      email: email == freezed ? _value.email : email as String,
      lastFourDigits: lastFourDigits == freezed
          ? _value.lastFourDigits
          : lastFourDigits as String,
      country: country == freezed ? _value.country : country as String,
    ));
  }
}

abstract class $CardMembershipCopyWith<$Res>
    implements $MembershipCopyWith<$Res> {
  factory $CardMembershipCopyWith(
          CardMembership value, $Res Function(CardMembership) then) =
      _$CardMembershipCopyWithImpl<$Res>;
  @override
  $Res call(
      {String status,
      int currentPeriodEnd,
      String email,
      String lastFourDigits,
      String country});
}

class _$CardMembershipCopyWithImpl<$Res> extends _$MembershipCopyWithImpl<$Res>
    implements $CardMembershipCopyWith<$Res> {
  _$CardMembershipCopyWithImpl(
      CardMembership _value, $Res Function(CardMembership) _then)
      : super(_value, (v) => _then(v as CardMembership));

  @override
  CardMembership get _value => super._value as CardMembership;

  @override
  $Res call({
    Object status = freezed,
    Object currentPeriodEnd = freezed,
    Object email = freezed,
    Object lastFourDigits = freezed,
    Object country = freezed,
  }) {
    return _then(CardMembership(
      status: status == freezed ? _value.status : status as String,
      currentPeriodEnd: currentPeriodEnd == freezed
          ? _value.currentPeriodEnd
          : currentPeriodEnd as int,
      email: email == freezed ? _value.email : email as String,
      lastFourDigits: lastFourDigits == freezed
          ? _value.lastFourDigits
          : lastFourDigits as String,
      country: country == freezed ? _value.country : country as String,
    ));
  }
}

class _$CardMembership with DiagnosticableTreeMixin implements CardMembership {
  const _$CardMembership(
      {@required this.status,
      @required this.currentPeriodEnd,
      @required this.email,
      @required this.lastFourDigits,
      @required this.country})
      : assert(status != null),
        assert(currentPeriodEnd != null),
        assert(email != null),
        assert(lastFourDigits != null),
        assert(country != null);

  @override
  final String status;
  @override
  final int currentPeriodEnd;
  @override
  final String email;
  @override
  final String lastFourDigits;
  @override
  final String country;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Membership.cardMembership(status: $status, currentPeriodEnd: $currentPeriodEnd, email: $email, lastFourDigits: $lastFourDigits, country: $country)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Membership.cardMembership'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('currentPeriodEnd', currentPeriodEnd))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('lastFourDigits', lastFourDigits))
      ..add(DiagnosticsProperty('country', country));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CardMembership &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.currentPeriodEnd, currentPeriodEnd) ||
                const DeepCollectionEquality()
                    .equals(other.currentPeriodEnd, currentPeriodEnd)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.lastFourDigits, lastFourDigits) ||
                const DeepCollectionEquality()
                    .equals(other.lastFourDigits, lastFourDigits)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality().equals(other.country, country)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(currentPeriodEnd) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(lastFourDigits) ^
      const DeepCollectionEquality().hash(country);

  @override
  $CardMembershipCopyWith<CardMembership> get copyWith =>
      _$CardMembershipCopyWithImpl<CardMembership>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result cardMembership(String status, int currentPeriodEnd, String email,
            String lastFourDigits, String country),
    @required
        Result sepaMembership(String status, int currentPeriodEnd, String email,
            String lastFourDigits, String country),
  }) {
    assert(cardMembership != null);
    assert(sepaMembership != null);
    return cardMembership(
        status, currentPeriodEnd, email, lastFourDigits, country);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cardMembership(String status, int currentPeriodEnd, String email,
        String lastFourDigits, String country),
    Result sepaMembership(String status, int currentPeriodEnd, String email,
        String lastFourDigits, String country),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cardMembership != null) {
      return cardMembership(
          status, currentPeriodEnd, email, lastFourDigits, country);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cardMembership(CardMembership value),
    @required Result sepaMembership(SepaMembership value),
  }) {
    assert(cardMembership != null);
    assert(sepaMembership != null);
    return cardMembership(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cardMembership(CardMembership value),
    Result sepaMembership(SepaMembership value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cardMembership != null) {
      return cardMembership(this);
    }
    return orElse();
  }
}

abstract class CardMembership implements Membership {
  const factory CardMembership(
      {@required String status,
      @required int currentPeriodEnd,
      @required String email,
      @required String lastFourDigits,
      @required String country}) = _$CardMembership;

  @override
  String get status;
  @override
  int get currentPeriodEnd;
  @override
  String get email;
  @override
  String get lastFourDigits;
  @override
  String get country;
  @override
  $CardMembershipCopyWith<CardMembership> get copyWith;
}

abstract class $SepaMembershipCopyWith<$Res>
    implements $MembershipCopyWith<$Res> {
  factory $SepaMembershipCopyWith(
          SepaMembership value, $Res Function(SepaMembership) then) =
      _$SepaMembershipCopyWithImpl<$Res>;
  @override
  $Res call(
      {String status,
      int currentPeriodEnd,
      String email,
      String lastFourDigits,
      String country});
}

class _$SepaMembershipCopyWithImpl<$Res> extends _$MembershipCopyWithImpl<$Res>
    implements $SepaMembershipCopyWith<$Res> {
  _$SepaMembershipCopyWithImpl(
      SepaMembership _value, $Res Function(SepaMembership) _then)
      : super(_value, (v) => _then(v as SepaMembership));

  @override
  SepaMembership get _value => super._value as SepaMembership;

  @override
  $Res call({
    Object status = freezed,
    Object currentPeriodEnd = freezed,
    Object email = freezed,
    Object lastFourDigits = freezed,
    Object country = freezed,
  }) {
    return _then(SepaMembership(
      status: status == freezed ? _value.status : status as String,
      currentPeriodEnd: currentPeriodEnd == freezed
          ? _value.currentPeriodEnd
          : currentPeriodEnd as int,
      email: email == freezed ? _value.email : email as String,
      lastFourDigits: lastFourDigits == freezed
          ? _value.lastFourDigits
          : lastFourDigits as String,
      country: country == freezed ? _value.country : country as String,
    ));
  }
}

class _$SepaMembership with DiagnosticableTreeMixin implements SepaMembership {
  const _$SepaMembership(
      {@required this.status,
      @required this.currentPeriodEnd,
      @required this.email,
      @required this.lastFourDigits,
      @required this.country})
      : assert(status != null),
        assert(currentPeriodEnd != null),
        assert(email != null),
        assert(lastFourDigits != null),
        assert(country != null);

  @override
  final String status;
  @override
  final int currentPeriodEnd;
  @override
  final String email;
  @override
  final String lastFourDigits;
  @override
  final String country;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Membership.sepaMembership(status: $status, currentPeriodEnd: $currentPeriodEnd, email: $email, lastFourDigits: $lastFourDigits, country: $country)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Membership.sepaMembership'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('currentPeriodEnd', currentPeriodEnd))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('lastFourDigits', lastFourDigits))
      ..add(DiagnosticsProperty('country', country));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SepaMembership &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.currentPeriodEnd, currentPeriodEnd) ||
                const DeepCollectionEquality()
                    .equals(other.currentPeriodEnd, currentPeriodEnd)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.lastFourDigits, lastFourDigits) ||
                const DeepCollectionEquality()
                    .equals(other.lastFourDigits, lastFourDigits)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality().equals(other.country, country)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(currentPeriodEnd) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(lastFourDigits) ^
      const DeepCollectionEquality().hash(country);

  @override
  $SepaMembershipCopyWith<SepaMembership> get copyWith =>
      _$SepaMembershipCopyWithImpl<SepaMembership>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result cardMembership(String status, int currentPeriodEnd, String email,
            String lastFourDigits, String country),
    @required
        Result sepaMembership(String status, int currentPeriodEnd, String email,
            String lastFourDigits, String country),
  }) {
    assert(cardMembership != null);
    assert(sepaMembership != null);
    return sepaMembership(
        status, currentPeriodEnd, email, lastFourDigits, country);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cardMembership(String status, int currentPeriodEnd, String email,
        String lastFourDigits, String country),
    Result sepaMembership(String status, int currentPeriodEnd, String email,
        String lastFourDigits, String country),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sepaMembership != null) {
      return sepaMembership(
          status, currentPeriodEnd, email, lastFourDigits, country);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cardMembership(CardMembership value),
    @required Result sepaMembership(SepaMembership value),
  }) {
    assert(cardMembership != null);
    assert(sepaMembership != null);
    return sepaMembership(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cardMembership(CardMembership value),
    Result sepaMembership(SepaMembership value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sepaMembership != null) {
      return sepaMembership(this);
    }
    return orElse();
  }
}

abstract class SepaMembership implements Membership {
  const factory SepaMembership(
      {@required String status,
      @required int currentPeriodEnd,
      @required String email,
      @required String lastFourDigits,
      @required String country}) = _$SepaMembership;

  @override
  String get status;
  @override
  int get currentPeriodEnd;
  @override
  String get email;
  @override
  String get lastFourDigits;
  @override
  String get country;
  @override
  $SepaMembershipCopyWith<SepaMembership> get copyWith;
}
