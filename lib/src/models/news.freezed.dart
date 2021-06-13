// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'news.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
News _$NewsFromJson(Map<String, dynamic> json) {
  return _News.fromJson(json);
}

/// @nodoc
class _$NewsTearOff {
  const _$NewsTearOff();

// ignore: unused_element
  _News call(
      {@required String id,
      @required String content,
      @required Author author,
      @required int timestamp,
      @required bool isPinned,
      String imageUrl}) {
    return _News(
      id: id,
      content: content,
      author: author,
      timestamp: timestamp,
      isPinned: isPinned,
      imageUrl: imageUrl,
    );
  }

// ignore: unused_element
  News fromJson(Map<String, Object> json) {
    return News.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $News = _$NewsTearOff();

/// @nodoc
mixin _$News {
  String get id;
  String get content;
  Author get author;
  int get timestamp;
  bool get isPinned;
  String get imageUrl;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $NewsCopyWith<News> get copyWith;
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
      String imageUrl});

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
    Object id = freezed,
    Object content = freezed,
    Object author = freezed,
    Object timestamp = freezed,
    Object isPinned = freezed,
    Object imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      content: content == freezed ? _value.content : content as String,
      author: author == freezed ? _value.author : author as Author,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as int,
      isPinned: isPinned == freezed ? _value.isPinned : isPinned as bool,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
    ));
  }

  @override
  $AuthorCopyWith<$Res> get author {
    if (_value.author == null) {
      return null;
    }
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
      String imageUrl});

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
    Object id = freezed,
    Object content = freezed,
    Object author = freezed,
    Object timestamp = freezed,
    Object isPinned = freezed,
    Object imageUrl = freezed,
  }) {
    return _then(_News(
      id: id == freezed ? _value.id : id as String,
      content: content == freezed ? _value.content : content as String,
      author: author == freezed ? _value.author : author as Author,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as int,
      isPinned: isPinned == freezed ? _value.isPinned : isPinned as bool,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_News extends _News {
  _$_News(
      {@required this.id,
      @required this.content,
      @required this.author,
      @required this.timestamp,
      @required this.isPinned,
      this.imageUrl})
      : assert(id != null),
        assert(content != null),
        assert(author != null),
        assert(timestamp != null),
        assert(isPinned != null),
        super._();

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
  final String imageUrl;

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
  _News._() : super._();
  factory _News(
      {@required String id,
      @required String content,
      @required Author author,
      @required int timestamp,
      @required bool isPinned,
      String imageUrl}) = _$_News;

  factory _News.fromJson(Map<String, dynamic> json) = _$_News.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  Author get author;
  @override
  int get timestamp;
  @override
  bool get isPinned;
  @override
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$NewsCopyWith<_News> get copyWith;
}
