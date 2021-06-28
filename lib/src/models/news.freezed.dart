// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'news.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

News _$NewsFromJson(Map<String, dynamic> json) {
  return _News.fromJson(json);
}

/// @nodoc
class _$NewsTearOff {
  const _$NewsTearOff();

  _News call(
      {required String id,
      required String content,
      required Author author,
      required int timestamp,
      required bool isPinned,
      String? imageUrl}) {
    return _News(
      id: id,
      content: content,
      author: author,
      timestamp: timestamp,
      isPinned: isPinned,
      imageUrl: imageUrl,
    );
  }

  News fromJson(Map<String, Object> json) {
    return News.fromJson(json);
  }
}

/// @nodoc
const $News = _$NewsTearOff();

/// @nodoc
mixin _$News {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  Author get author => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  bool get isPinned => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsCopyWith<News> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsCopyWith<$Res> {
  factory $NewsCopyWith(News value, $Res Function(News) then) =
      _$NewsCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String content,
      Author author,
      int timestamp,
      bool isPinned,
      String? imageUrl});

  $AuthorCopyWith<$Res> get author;
}

/// @nodoc
class _$NewsCopyWithImpl<$Res> implements $NewsCopyWith<$Res> {
  _$NewsCopyWithImpl(this._value, this._then);

  final News _value;
  // ignore: unused_field
  final $Res Function(News) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? author = freezed,
    Object? timestamp = freezed,
    Object? isPinned = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as Author,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      isPinned: isPinned == freezed
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $AuthorCopyWith<$Res> get author {
    return $AuthorCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value));
    });
  }
}

/// @nodoc
abstract class _$NewsCopyWith<$Res> implements $NewsCopyWith<$Res> {
  factory _$NewsCopyWith(_News value, $Res Function(_News) then) =
      __$NewsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String content,
      Author author,
      int timestamp,
      bool isPinned,
      String? imageUrl});

  @override
  $AuthorCopyWith<$Res> get author;
}

/// @nodoc
class __$NewsCopyWithImpl<$Res> extends _$NewsCopyWithImpl<$Res>
    implements _$NewsCopyWith<$Res> {
  __$NewsCopyWithImpl(_News _value, $Res Function(_News) _then)
      : super(_value, (v) => _then(v as _News));

  @override
  _News get _value => super._value as _News;

  @override
  $Res call({
    Object? id = freezed,
    Object? content = freezed,
    Object? author = freezed,
    Object? timestamp = freezed,
    Object? isPinned = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_News(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as Author,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      isPinned: isPinned == freezed
          ? _value.isPinned
          : isPinned // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_News extends _News {
  _$_News(
      {required this.id,
      required this.content,
      required this.author,
      required this.timestamp,
      required this.isPinned,
      this.imageUrl})
      : super._();

  factory _$_News.fromJson(Map<String, dynamic> json) =>
      _$_$_NewsFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final Author author;
  @override
  final int timestamp;
  @override
  final bool isPinned;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'News(id: $id, content: $content, author: $author, timestamp: $timestamp, isPinned: $isPinned, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _News &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.isPinned, isPinned) ||
                const DeepCollectionEquality()
                    .equals(other.isPinned, isPinned)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(isPinned) ^
      const DeepCollectionEquality().hash(imageUrl);

  @JsonKey(ignore: true)
  @override
  _$NewsCopyWith<_News> get copyWith =>
      __$NewsCopyWithImpl<_News>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NewsToJson(this);
  }
}

abstract class _News extends News {
  factory _News(
      {required String id,
      required String content,
      required Author author,
      required int timestamp,
      required bool isPinned,
      String? imageUrl}) = _$_News;
  _News._() : super._();

  factory _News.fromJson(Map<String, dynamic> json) = _$_News.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get content => throw _privateConstructorUsedError;
  @override
  Author get author => throw _privateConstructorUsedError;
  @override
  int get timestamp => throw _privateConstructorUsedError;
  @override
  bool get isPinned => throw _privateConstructorUsedError;
  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NewsCopyWith<_News> get copyWith => throw _privateConstructorUsedError;
}
