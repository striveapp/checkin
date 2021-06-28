// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'json_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JsonModel _$JsonModelFromJson(Map<String, dynamic> json) {
  return _JsonModel.fromJson(json);
}

/// @nodoc
class _$JsonModelTearOff {
  const _$JsonModelTearOff();

  _JsonModel call(
      {String? simpleField,
      required String requiredField,
      bool defaultField = true,
      @GradeNullableConverter() Grade? grade}) {
    return _JsonModel(
      simpleField: simpleField,
      requiredField: requiredField,
      defaultField: defaultField,
      grade: grade,
    );
  }

  JsonModel fromJson(Map<String, Object> json) {
    return JsonModel.fromJson(json);
  }
}

/// @nodoc
const $JsonModel = _$JsonModelTearOff();

/// @nodoc
mixin _$JsonModel {
  String? get simpleField => throw _privateConstructorUsedError;
  String get requiredField => throw _privateConstructorUsedError;
  bool get defaultField => throw _privateConstructorUsedError;
  @GradeNullableConverter()
  Grade? get grade => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JsonModelCopyWith<JsonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JsonModelCopyWith<$Res> {
  factory $JsonModelCopyWith(JsonModel value, $Res Function(JsonModel) then) =
      _$JsonModelCopyWithImpl<$Res>;
  $Res call(
      {String? simpleField,
      String requiredField,
      bool defaultField,
      @GradeNullableConverter() Grade? grade});
}

/// @nodoc
class _$JsonModelCopyWithImpl<$Res> implements $JsonModelCopyWith<$Res> {
  _$JsonModelCopyWithImpl(this._value, this._then);

  final JsonModel _value;
  // ignore: unused_field
  final $Res Function(JsonModel) _then;

  @override
  $Res call({
    Object? simpleField = freezed,
    Object? requiredField = freezed,
    Object? defaultField = freezed,
    Object? grade = freezed,
  }) {
    return _then(_value.copyWith(
      simpleField: simpleField == freezed
          ? _value.simpleField
          : simpleField // ignore: cast_nullable_to_non_nullable
              as String?,
      requiredField: requiredField == freezed
          ? _value.requiredField
          : requiredField // ignore: cast_nullable_to_non_nullable
              as String,
      defaultField: defaultField == freezed
          ? _value.defaultField
          : defaultField // ignore: cast_nullable_to_non_nullable
              as bool,
      grade: grade == freezed
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as Grade?,
    ));
  }
}

/// @nodoc
abstract class _$JsonModelCopyWith<$Res> implements $JsonModelCopyWith<$Res> {
  factory _$JsonModelCopyWith(
          _JsonModel value, $Res Function(_JsonModel) then) =
      __$JsonModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? simpleField,
      String requiredField,
      bool defaultField,
      @GradeNullableConverter() Grade? grade});
}

/// @nodoc
class __$JsonModelCopyWithImpl<$Res> extends _$JsonModelCopyWithImpl<$Res>
    implements _$JsonModelCopyWith<$Res> {
  __$JsonModelCopyWithImpl(_JsonModel _value, $Res Function(_JsonModel) _then)
      : super(_value, (v) => _then(v as _JsonModel));

  @override
  _JsonModel get _value => super._value as _JsonModel;

  @override
  $Res call({
    Object? simpleField = freezed,
    Object? requiredField = freezed,
    Object? defaultField = freezed,
    Object? grade = freezed,
  }) {
    return _then(_JsonModel(
      simpleField: simpleField == freezed
          ? _value.simpleField
          : simpleField // ignore: cast_nullable_to_non_nullable
              as String?,
      requiredField: requiredField == freezed
          ? _value.requiredField
          : requiredField // ignore: cast_nullable_to_non_nullable
              as String,
      defaultField: defaultField == freezed
          ? _value.defaultField
          : defaultField // ignore: cast_nullable_to_non_nullable
              as bool,
      grade: grade == freezed
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as Grade?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JsonModel with DiagnosticableTreeMixin implements _JsonModel {
  _$_JsonModel(
      {this.simpleField,
      required this.requiredField,
      this.defaultField = true,
      @GradeNullableConverter() this.grade});

  factory _$_JsonModel.fromJson(Map<String, dynamic> json) =>
      _$_$_JsonModelFromJson(json);

  @override
  final String? simpleField;
  @override
  final String requiredField;
  @JsonKey(defaultValue: true)
  @override
  final bool defaultField;
  @override
  @GradeNullableConverter()
  final Grade? grade;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'JsonModel(simpleField: $simpleField, requiredField: $requiredField, defaultField: $defaultField, grade: $grade)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'JsonModel'))
      ..add(DiagnosticsProperty('simpleField', simpleField))
      ..add(DiagnosticsProperty('requiredField', requiredField))
      ..add(DiagnosticsProperty('defaultField', defaultField))
      ..add(DiagnosticsProperty('grade', grade));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _JsonModel &&
            (identical(other.simpleField, simpleField) ||
                const DeepCollectionEquality()
                    .equals(other.simpleField, simpleField)) &&
            (identical(other.requiredField, requiredField) ||
                const DeepCollectionEquality()
                    .equals(other.requiredField, requiredField)) &&
            (identical(other.defaultField, defaultField) ||
                const DeepCollectionEquality()
                    .equals(other.defaultField, defaultField)) &&
            (identical(other.grade, grade) ||
                const DeepCollectionEquality().equals(other.grade, grade)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(simpleField) ^
      const DeepCollectionEquality().hash(requiredField) ^
      const DeepCollectionEquality().hash(defaultField) ^
      const DeepCollectionEquality().hash(grade);

  @JsonKey(ignore: true)
  @override
  _$JsonModelCopyWith<_JsonModel> get copyWith =>
      __$JsonModelCopyWithImpl<_JsonModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_JsonModelToJson(this);
  }
}

abstract class _JsonModel implements JsonModel {
  factory _JsonModel(
      {String? simpleField,
      required String requiredField,
      bool defaultField,
      @GradeNullableConverter() Grade? grade}) = _$_JsonModel;

  factory _JsonModel.fromJson(Map<String, dynamic> json) =
      _$_JsonModel.fromJson;

  @override
  String? get simpleField => throw _privateConstructorUsedError;
  @override
  String get requiredField => throw _privateConstructorUsedError;
  @override
  bool get defaultField => throw _privateConstructorUsedError;
  @override
  @GradeNullableConverter()
  Grade? get grade => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$JsonModelCopyWith<_JsonModel> get copyWith =>
      throw _privateConstructorUsedError;
}
