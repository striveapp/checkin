// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'author.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Author _$AuthorFromJson(Map<String, dynamic> json) {
  return _Author.fromJson(json);
}

/// @nodoc
class _$AuthorTearOff {
  const _$AuthorTearOff();

// ignore: unused_element
  _Author call(
      {@required String email,
      @required String imageUrl,
      @required String name,
      @GradeConverter() Grade grade}) {
    return _Author(
      email: email,
      imageUrl: imageUrl,
      name: name,
      grade: grade,
    );
  }

// ignore: unused_element
  Author fromJson(Map<String, Object> json) {
    return Author.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Author = _$AuthorTearOff();

/// @nodoc
mixin _$Author {
  String get email;
  String get imageUrl;
  String get name;
  @GradeConverter()
  Grade get grade;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $AuthorCopyWith<Author> get copyWith;
}

/// @nodoc
abstract class $AuthorCopyWith<$Res> {
  factory $AuthorCopyWith(Author value, $Res Function(Author) then) = _$AuthorCopyWithImpl<$Res>;
  $Res call({String email, String imageUrl, String name, @GradeConverter() Grade grade});
}

/// @nodoc
class _$AuthorCopyWithImpl<$Res> implements $AuthorCopyWith<$Res> {
  _$AuthorCopyWithImpl(this._value, this._then);

  final Author _value;
  // ignore: unused_field
  final $Res Function(Author) _then;

  @override
  $Res call({
    Object email = freezed,
    Object imageUrl = freezed,
    Object name = freezed,
    Object grade = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      name: name == freezed ? _value.name : name as String,
      grade: grade == freezed ? _value.grade : grade as Grade,
    ));
  }
}

/// @nodoc
abstract class _$AuthorCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$AuthorCopyWith(_Author value, $Res Function(_Author) then) =
      __$AuthorCopyWithImpl<$Res>;
  @override
  $Res call({String email, String imageUrl, String name, @GradeConverter() Grade grade});
}

/// @nodoc
class __$AuthorCopyWithImpl<$Res> extends _$AuthorCopyWithImpl<$Res>
    implements _$AuthorCopyWith<$Res> {
  __$AuthorCopyWithImpl(_Author _value, $Res Function(_Author) _then)
      : super(_value, (v) => _then(v as _Author));

  @override
  _Author get _value => super._value as _Author;

  @override
  $Res call({
    Object email = freezed,
    Object imageUrl = freezed,
    Object name = freezed,
    Object grade = freezed,
  }) {
    return _then(_Author(
      email: email == freezed ? _value.email : email as String,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      name: name == freezed ? _value.name : name as String,
      grade: grade == freezed ? _value.grade : grade as Grade,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Author with DiagnosticableTreeMixin implements _Author {
  _$_Author(
      {@required this.email,
      @required this.imageUrl,
      @required this.name,
      @GradeConverter() this.grade})
      : assert(email != null),
        assert(imageUrl != null),
        assert(name != null);

  factory _$_Author.fromJson(Map<String, dynamic> json) => _$_$_AuthorFromJson(json);

  @override
  final String email;
  @override
  final String imageUrl;
  @override
  final String name;
  @override
  @GradeConverter()
  final Grade grade;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Author(email: $email, imageUrl: $imageUrl, name: $name, grade: $grade)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Author'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('grade', grade));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Author &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality().equals(other.imageUrl, imageUrl)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.grade, grade) ||
                const DeepCollectionEquality().equals(other.grade, grade)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(grade);

  @JsonKey(ignore: true)
  @override
  _$AuthorCopyWith<_Author> get copyWith => __$AuthorCopyWithImpl<_Author>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AuthorToJson(this);
  }
}

abstract class _Author implements Author {
  factory _Author(
      {@required String email,
      @required String imageUrl,
      @required String name,
      @GradeConverter() Grade grade}) = _$_Author;

  factory _Author.fromJson(Map<String, dynamic> json) = _$_Author.fromJson;

  @override
  String get email;
  @override
  String get imageUrl;
  @override
  String get name;
  @override
  @GradeConverter()
  Grade get grade;
  @override
  @JsonKey(ignore: true)
  _$AuthorCopyWith<_Author> get copyWith;
}
