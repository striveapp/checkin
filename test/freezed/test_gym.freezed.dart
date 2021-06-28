// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'test_gym.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TestGym _$TestGymFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'default':
      return _TestGym.fromJson(json);
    case 'caseOne':
      return _CaseOne.fromJson(json);
    case 'caseTwo':
      return _CaseTwo.fromJson(json);
    case 'caseThree':
      return CaseThree.fromJson(json);
    case 'caseFour':
      return CaseFour.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$TestGymTearOff {
  const _$TestGymTearOff();

  _TestGym call(
      {String? domain,
      String? host,
      String? stripePublicKey,
      required String requiredField}) {
    return _TestGym(
      domain: domain,
      host: host,
      stripePublicKey: stripePublicKey,
      requiredField: requiredField,
    );
  }

  _CaseOne caseOne([String caseOne = "caseOne"]) {
    return _CaseOne(
      caseOne,
    );
  }

  _CaseTwo caseTwo(String caseTwo) {
    return _CaseTwo(
      caseTwo,
    );
  }

  CaseThree caseThree({required String caseThree}) {
    return CaseThree(
      caseThree: caseThree,
    );
  }

  CaseFour caseFour({String? caseFour}) {
    return CaseFour(
      caseFour: caseFour,
    );
  }

  TestGym fromJson(Map<String, Object> json) {
    return TestGym.fromJson(json);
  }
}

/// @nodoc
const $TestGym = _$TestGymTearOff();

/// @nodoc
mixin _$TestGym {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? domain, String? host, String? stripePublicKey,
            String requiredField)
        $default, {
    required TResult Function(String caseOne) caseOne,
    required TResult Function(String caseTwo) caseTwo,
    required TResult Function(String caseThree) caseThree,
    required TResult Function(String? caseFour) caseFour,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? domain, String? host, String? stripePublicKey,
            String requiredField)?
        $default, {
    TResult Function(String caseOne)? caseOne,
    TResult Function(String caseTwo)? caseTwo,
    TResult Function(String caseThree)? caseThree,
    TResult Function(String? caseFour)? caseFour,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TestGym value) $default, {
    required TResult Function(_CaseOne value) caseOne,
    required TResult Function(_CaseTwo value) caseTwo,
    required TResult Function(CaseThree value) caseThree,
    required TResult Function(CaseFour value) caseFour,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TestGym value)? $default, {
    TResult Function(_CaseOne value)? caseOne,
    TResult Function(_CaseTwo value)? caseTwo,
    TResult Function(CaseThree value)? caseThree,
    TResult Function(CaseFour value)? caseFour,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestGymCopyWith<$Res> {
  factory $TestGymCopyWith(TestGym value, $Res Function(TestGym) then) =
      _$TestGymCopyWithImpl<$Res>;
}

/// @nodoc
class _$TestGymCopyWithImpl<$Res> implements $TestGymCopyWith<$Res> {
  _$TestGymCopyWithImpl(this._value, this._then);

  final TestGym _value;
  // ignore: unused_field
  final $Res Function(TestGym) _then;
}

/// @nodoc
abstract class _$TestGymCopyWith<$Res> {
  factory _$TestGymCopyWith(_TestGym value, $Res Function(_TestGym) then) =
      __$TestGymCopyWithImpl<$Res>;
  $Res call(
      {String? domain,
      String? host,
      String? stripePublicKey,
      String requiredField});
}

/// @nodoc
class __$TestGymCopyWithImpl<$Res> extends _$TestGymCopyWithImpl<$Res>
    implements _$TestGymCopyWith<$Res> {
  __$TestGymCopyWithImpl(_TestGym _value, $Res Function(_TestGym) _then)
      : super(_value, (v) => _then(v as _TestGym));

  @override
  _TestGym get _value => super._value as _TestGym;

  @override
  $Res call({
    Object? domain = freezed,
    Object? host = freezed,
    Object? stripePublicKey = freezed,
    Object? requiredField = freezed,
  }) {
    return _then(_TestGym(
      domain: domain == freezed
          ? _value.domain
          : domain // ignore: cast_nullable_to_non_nullable
              as String?,
      host: host == freezed
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String?,
      stripePublicKey: stripePublicKey == freezed
          ? _value.stripePublicKey
          : stripePublicKey // ignore: cast_nullable_to_non_nullable
              as String?,
      requiredField: requiredField == freezed
          ? _value.requiredField
          : requiredField // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TestGym with DiagnosticableTreeMixin implements _TestGym {
  _$_TestGym(
      {this.domain,
      this.host,
      this.stripePublicKey,
      required this.requiredField});

  factory _$_TestGym.fromJson(Map<String, dynamic> json) =>
      _$_$_TestGymFromJson(json);

  @override
  final String? domain;
  @override
  final String? host;
  @override
  final String? stripePublicKey;
  @override
  final String requiredField;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TestGym(domain: $domain, host: $host, stripePublicKey: $stripePublicKey, requiredField: $requiredField)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TestGym'))
      ..add(DiagnosticsProperty('domain', domain))
      ..add(DiagnosticsProperty('host', host))
      ..add(DiagnosticsProperty('stripePublicKey', stripePublicKey))
      ..add(DiagnosticsProperty('requiredField', requiredField));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TestGym &&
            (identical(other.domain, domain) ||
                const DeepCollectionEquality().equals(other.domain, domain)) &&
            (identical(other.host, host) ||
                const DeepCollectionEquality().equals(other.host, host)) &&
            (identical(other.stripePublicKey, stripePublicKey) ||
                const DeepCollectionEquality()
                    .equals(other.stripePublicKey, stripePublicKey)) &&
            (identical(other.requiredField, requiredField) ||
                const DeepCollectionEquality()
                    .equals(other.requiredField, requiredField)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(domain) ^
      const DeepCollectionEquality().hash(host) ^
      const DeepCollectionEquality().hash(stripePublicKey) ^
      const DeepCollectionEquality().hash(requiredField);

  @JsonKey(ignore: true)
  @override
  _$TestGymCopyWith<_TestGym> get copyWith =>
      __$TestGymCopyWithImpl<_TestGym>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? domain, String? host, String? stripePublicKey,
            String requiredField)
        $default, {
    required TResult Function(String caseOne) caseOne,
    required TResult Function(String caseTwo) caseTwo,
    required TResult Function(String caseThree) caseThree,
    required TResult Function(String? caseFour) caseFour,
  }) {
    return $default(domain, host, stripePublicKey, requiredField);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? domain, String? host, String? stripePublicKey,
            String requiredField)?
        $default, {
    TResult Function(String caseOne)? caseOne,
    TResult Function(String caseTwo)? caseTwo,
    TResult Function(String caseThree)? caseThree,
    TResult Function(String? caseFour)? caseFour,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(domain, host, stripePublicKey, requiredField);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TestGym value) $default, {
    required TResult Function(_CaseOne value) caseOne,
    required TResult Function(_CaseTwo value) caseTwo,
    required TResult Function(CaseThree value) caseThree,
    required TResult Function(CaseFour value) caseFour,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TestGym value)? $default, {
    TResult Function(_CaseOne value)? caseOne,
    TResult Function(_CaseTwo value)? caseTwo,
    TResult Function(CaseThree value)? caseThree,
    TResult Function(CaseFour value)? caseFour,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TestGymToJson(this)..['runtimeType'] = 'default';
  }
}

abstract class _TestGym implements TestGym {
  factory _TestGym(
      {String? domain,
      String? host,
      String? stripePublicKey,
      required String requiredField}) = _$_TestGym;

  factory _TestGym.fromJson(Map<String, dynamic> json) = _$_TestGym.fromJson;

  String? get domain => throw _privateConstructorUsedError;
  String? get host => throw _privateConstructorUsedError;
  String? get stripePublicKey => throw _privateConstructorUsedError;
  String get requiredField => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$TestGymCopyWith<_TestGym> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CaseOneCopyWith<$Res> {
  factory _$CaseOneCopyWith(_CaseOne value, $Res Function(_CaseOne) then) =
      __$CaseOneCopyWithImpl<$Res>;
  $Res call({String caseOne});
}

/// @nodoc
class __$CaseOneCopyWithImpl<$Res> extends _$TestGymCopyWithImpl<$Res>
    implements _$CaseOneCopyWith<$Res> {
  __$CaseOneCopyWithImpl(_CaseOne _value, $Res Function(_CaseOne) _then)
      : super(_value, (v) => _then(v as _CaseOne));

  @override
  _CaseOne get _value => super._value as _CaseOne;

  @override
  $Res call({
    Object? caseOne = freezed,
  }) {
    return _then(_CaseOne(
      caseOne == freezed
          ? _value.caseOne
          : caseOne // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CaseOne with DiagnosticableTreeMixin implements _CaseOne {
  const _$_CaseOne([this.caseOne = "caseOne"]);

  factory _$_CaseOne.fromJson(Map<String, dynamic> json) =>
      _$_$_CaseOneFromJson(json);

  @JsonKey(defaultValue: "caseOne")
  @override
  final String caseOne;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TestGym.caseOne(caseOne: $caseOne)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TestGym.caseOne'))
      ..add(DiagnosticsProperty('caseOne', caseOne));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CaseOne &&
            (identical(other.caseOne, caseOne) ||
                const DeepCollectionEquality().equals(other.caseOne, caseOne)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(caseOne);

  @JsonKey(ignore: true)
  @override
  _$CaseOneCopyWith<_CaseOne> get copyWith =>
      __$CaseOneCopyWithImpl<_CaseOne>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? domain, String? host, String? stripePublicKey,
            String requiredField)
        $default, {
    required TResult Function(String caseOne) caseOne,
    required TResult Function(String caseTwo) caseTwo,
    required TResult Function(String caseThree) caseThree,
    required TResult Function(String? caseFour) caseFour,
  }) {
    return caseOne(this.caseOne);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? domain, String? host, String? stripePublicKey,
            String requiredField)?
        $default, {
    TResult Function(String caseOne)? caseOne,
    TResult Function(String caseTwo)? caseTwo,
    TResult Function(String caseThree)? caseThree,
    TResult Function(String? caseFour)? caseFour,
    required TResult orElse(),
  }) {
    if (caseOne != null) {
      return caseOne(this.caseOne);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TestGym value) $default, {
    required TResult Function(_CaseOne value) caseOne,
    required TResult Function(_CaseTwo value) caseTwo,
    required TResult Function(CaseThree value) caseThree,
    required TResult Function(CaseFour value) caseFour,
  }) {
    return caseOne(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TestGym value)? $default, {
    TResult Function(_CaseOne value)? caseOne,
    TResult Function(_CaseTwo value)? caseTwo,
    TResult Function(CaseThree value)? caseThree,
    TResult Function(CaseFour value)? caseFour,
    required TResult orElse(),
  }) {
    if (caseOne != null) {
      return caseOne(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CaseOneToJson(this)..['runtimeType'] = 'caseOne';
  }
}

abstract class _CaseOne implements TestGym {
  const factory _CaseOne([String caseOne]) = _$_CaseOne;

  factory _CaseOne.fromJson(Map<String, dynamic> json) = _$_CaseOne.fromJson;

  String get caseOne => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$CaseOneCopyWith<_CaseOne> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CaseTwoCopyWith<$Res> {
  factory _$CaseTwoCopyWith(_CaseTwo value, $Res Function(_CaseTwo) then) =
      __$CaseTwoCopyWithImpl<$Res>;
  $Res call({String caseTwo});
}

/// @nodoc
class __$CaseTwoCopyWithImpl<$Res> extends _$TestGymCopyWithImpl<$Res>
    implements _$CaseTwoCopyWith<$Res> {
  __$CaseTwoCopyWithImpl(_CaseTwo _value, $Res Function(_CaseTwo) _then)
      : super(_value, (v) => _then(v as _CaseTwo));

  @override
  _CaseTwo get _value => super._value as _CaseTwo;

  @override
  $Res call({
    Object? caseTwo = freezed,
  }) {
    return _then(_CaseTwo(
      caseTwo == freezed
          ? _value.caseTwo
          : caseTwo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CaseTwo with DiagnosticableTreeMixin implements _CaseTwo {
  const _$_CaseTwo(this.caseTwo);

  factory _$_CaseTwo.fromJson(Map<String, dynamic> json) =>
      _$_$_CaseTwoFromJson(json);

  @override
  final String caseTwo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TestGym.caseTwo(caseTwo: $caseTwo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TestGym.caseTwo'))
      ..add(DiagnosticsProperty('caseTwo', caseTwo));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CaseTwo &&
            (identical(other.caseTwo, caseTwo) ||
                const DeepCollectionEquality().equals(other.caseTwo, caseTwo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(caseTwo);

  @JsonKey(ignore: true)
  @override
  _$CaseTwoCopyWith<_CaseTwo> get copyWith =>
      __$CaseTwoCopyWithImpl<_CaseTwo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? domain, String? host, String? stripePublicKey,
            String requiredField)
        $default, {
    required TResult Function(String caseOne) caseOne,
    required TResult Function(String caseTwo) caseTwo,
    required TResult Function(String caseThree) caseThree,
    required TResult Function(String? caseFour) caseFour,
  }) {
    return caseTwo(this.caseTwo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? domain, String? host, String? stripePublicKey,
            String requiredField)?
        $default, {
    TResult Function(String caseOne)? caseOne,
    TResult Function(String caseTwo)? caseTwo,
    TResult Function(String caseThree)? caseThree,
    TResult Function(String? caseFour)? caseFour,
    required TResult orElse(),
  }) {
    if (caseTwo != null) {
      return caseTwo(this.caseTwo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TestGym value) $default, {
    required TResult Function(_CaseOne value) caseOne,
    required TResult Function(_CaseTwo value) caseTwo,
    required TResult Function(CaseThree value) caseThree,
    required TResult Function(CaseFour value) caseFour,
  }) {
    return caseTwo(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TestGym value)? $default, {
    TResult Function(_CaseOne value)? caseOne,
    TResult Function(_CaseTwo value)? caseTwo,
    TResult Function(CaseThree value)? caseThree,
    TResult Function(CaseFour value)? caseFour,
    required TResult orElse(),
  }) {
    if (caseTwo != null) {
      return caseTwo(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CaseTwoToJson(this)..['runtimeType'] = 'caseTwo';
  }
}

abstract class _CaseTwo implements TestGym {
  const factory _CaseTwo(String caseTwo) = _$_CaseTwo;

  factory _CaseTwo.fromJson(Map<String, dynamic> json) = _$_CaseTwo.fromJson;

  String get caseTwo => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$CaseTwoCopyWith<_CaseTwo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaseThreeCopyWith<$Res> {
  factory $CaseThreeCopyWith(CaseThree value, $Res Function(CaseThree) then) =
      _$CaseThreeCopyWithImpl<$Res>;
  $Res call({String caseThree});
}

/// @nodoc
class _$CaseThreeCopyWithImpl<$Res> extends _$TestGymCopyWithImpl<$Res>
    implements $CaseThreeCopyWith<$Res> {
  _$CaseThreeCopyWithImpl(CaseThree _value, $Res Function(CaseThree) _then)
      : super(_value, (v) => _then(v as CaseThree));

  @override
  CaseThree get _value => super._value as CaseThree;

  @override
  $Res call({
    Object? caseThree = freezed,
  }) {
    return _then(CaseThree(
      caseThree: caseThree == freezed
          ? _value.caseThree
          : caseThree // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CaseThree with DiagnosticableTreeMixin implements CaseThree {
  const _$CaseThree({required this.caseThree});

  factory _$CaseThree.fromJson(Map<String, dynamic> json) =>
      _$_$CaseThreeFromJson(json);

  @override
  final String caseThree;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TestGym.caseThree(caseThree: $caseThree)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TestGym.caseThree'))
      ..add(DiagnosticsProperty('caseThree', caseThree));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CaseThree &&
            (identical(other.caseThree, caseThree) ||
                const DeepCollectionEquality()
                    .equals(other.caseThree, caseThree)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(caseThree);

  @JsonKey(ignore: true)
  @override
  $CaseThreeCopyWith<CaseThree> get copyWith =>
      _$CaseThreeCopyWithImpl<CaseThree>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? domain, String? host, String? stripePublicKey,
            String requiredField)
        $default, {
    required TResult Function(String caseOne) caseOne,
    required TResult Function(String caseTwo) caseTwo,
    required TResult Function(String caseThree) caseThree,
    required TResult Function(String? caseFour) caseFour,
  }) {
    return caseThree(this.caseThree);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? domain, String? host, String? stripePublicKey,
            String requiredField)?
        $default, {
    TResult Function(String caseOne)? caseOne,
    TResult Function(String caseTwo)? caseTwo,
    TResult Function(String caseThree)? caseThree,
    TResult Function(String? caseFour)? caseFour,
    required TResult orElse(),
  }) {
    if (caseThree != null) {
      return caseThree(this.caseThree);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TestGym value) $default, {
    required TResult Function(_CaseOne value) caseOne,
    required TResult Function(_CaseTwo value) caseTwo,
    required TResult Function(CaseThree value) caseThree,
    required TResult Function(CaseFour value) caseFour,
  }) {
    return caseThree(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TestGym value)? $default, {
    TResult Function(_CaseOne value)? caseOne,
    TResult Function(_CaseTwo value)? caseTwo,
    TResult Function(CaseThree value)? caseThree,
    TResult Function(CaseFour value)? caseFour,
    required TResult orElse(),
  }) {
    if (caseThree != null) {
      return caseThree(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$CaseThreeToJson(this)..['runtimeType'] = 'caseThree';
  }
}

abstract class CaseThree implements TestGym {
  const factory CaseThree({required String caseThree}) = _$CaseThree;

  factory CaseThree.fromJson(Map<String, dynamic> json) = _$CaseThree.fromJson;

  String get caseThree => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CaseThreeCopyWith<CaseThree> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaseFourCopyWith<$Res> {
  factory $CaseFourCopyWith(CaseFour value, $Res Function(CaseFour) then) =
      _$CaseFourCopyWithImpl<$Res>;
  $Res call({String? caseFour});
}

/// @nodoc
class _$CaseFourCopyWithImpl<$Res> extends _$TestGymCopyWithImpl<$Res>
    implements $CaseFourCopyWith<$Res> {
  _$CaseFourCopyWithImpl(CaseFour _value, $Res Function(CaseFour) _then)
      : super(_value, (v) => _then(v as CaseFour));

  @override
  CaseFour get _value => super._value as CaseFour;

  @override
  $Res call({
    Object? caseFour = freezed,
  }) {
    return _then(CaseFour(
      caseFour: caseFour == freezed
          ? _value.caseFour
          : caseFour // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CaseFour with DiagnosticableTreeMixin implements CaseFour {
  const _$CaseFour({this.caseFour});

  factory _$CaseFour.fromJson(Map<String, dynamic> json) =>
      _$_$CaseFourFromJson(json);

  @override
  final String? caseFour;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TestGym.caseFour(caseFour: $caseFour)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TestGym.caseFour'))
      ..add(DiagnosticsProperty('caseFour', caseFour));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CaseFour &&
            (identical(other.caseFour, caseFour) ||
                const DeepCollectionEquality()
                    .equals(other.caseFour, caseFour)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(caseFour);

  @JsonKey(ignore: true)
  @override
  $CaseFourCopyWith<CaseFour> get copyWith =>
      _$CaseFourCopyWithImpl<CaseFour>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? domain, String? host, String? stripePublicKey,
            String requiredField)
        $default, {
    required TResult Function(String caseOne) caseOne,
    required TResult Function(String caseTwo) caseTwo,
    required TResult Function(String caseThree) caseThree,
    required TResult Function(String? caseFour) caseFour,
  }) {
    return caseFour(this.caseFour);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? domain, String? host, String? stripePublicKey,
            String requiredField)?
        $default, {
    TResult Function(String caseOne)? caseOne,
    TResult Function(String caseTwo)? caseTwo,
    TResult Function(String caseThree)? caseThree,
    TResult Function(String? caseFour)? caseFour,
    required TResult orElse(),
  }) {
    if (caseFour != null) {
      return caseFour(this.caseFour);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TestGym value) $default, {
    required TResult Function(_CaseOne value) caseOne,
    required TResult Function(_CaseTwo value) caseTwo,
    required TResult Function(CaseThree value) caseThree,
    required TResult Function(CaseFour value) caseFour,
  }) {
    return caseFour(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TestGym value)? $default, {
    TResult Function(_CaseOne value)? caseOne,
    TResult Function(_CaseTwo value)? caseTwo,
    TResult Function(CaseThree value)? caseThree,
    TResult Function(CaseFour value)? caseFour,
    required TResult orElse(),
  }) {
    if (caseFour != null) {
      return caseFour(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$CaseFourToJson(this)..['runtimeType'] = 'caseFour';
  }
}

abstract class CaseFour implements TestGym {
  const factory CaseFour({String? caseFour}) = _$CaseFour;

  factory CaseFour.fromJson(Map<String, dynamic> json) = _$CaseFour.fromJson;

  String? get caseFour => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CaseFourCopyWith<CaseFour> get copyWith =>
      throw _privateConstructorUsedError;
}
