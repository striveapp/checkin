// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'news_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$NewsEventTearOff {
  const _$NewsEventTearOff();

// ignore: unused_element
  InitializeNews initializeNews() {
    return const InitializeNews();
  }

// ignore: unused_element
  NewsUpdated newsUpdated({@required List<News> newsList}) {
    return NewsUpdated(
      newsList: newsList,
    );
  }

// ignore: unused_element
  AddNews addNews({@required String content, @required Author author}) {
    return AddNews(
      content: content,
      author: author,
    );
  }

// ignore: unused_element
  DeleteNews deleteNews({@required String id}) {
    return DeleteNews(
      id: id,
    );
  }

// ignore: unused_element
  PinNews pinNews({@required String id}) {
    return PinNews(
      id: id,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $NewsEvent = _$NewsEventTearOff();

/// @nodoc
mixin _$NewsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeNews(),
    @required TResult newsUpdated(List<News> newsList),
    @required TResult addNews(String content, Author author),
    @required TResult deleteNews(String id),
    @required TResult pinNews(String id),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeNews(),
    TResult newsUpdated(List<News> newsList),
    TResult addNews(String content, Author author),
    TResult deleteNews(String id),
    TResult pinNews(String id),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeNews(InitializeNews value),
    @required TResult newsUpdated(NewsUpdated value),
    @required TResult addNews(AddNews value),
    @required TResult deleteNews(DeleteNews value),
    @required TResult pinNews(PinNews value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeNews(InitializeNews value),
    TResult newsUpdated(NewsUpdated value),
    TResult addNews(AddNews value),
    TResult deleteNews(DeleteNews value),
    TResult pinNews(PinNews value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $NewsEventCopyWith<$Res> {
  factory $NewsEventCopyWith(NewsEvent value, $Res Function(NewsEvent) then) =
      _$NewsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$NewsEventCopyWithImpl<$Res> implements $NewsEventCopyWith<$Res> {
  _$NewsEventCopyWithImpl(this._value, this._then);

  final NewsEvent _value;
  // ignore: unused_field
  final $Res Function(NewsEvent) _then;
}

/// @nodoc
abstract class $InitializeNewsCopyWith<$Res> {
  factory $InitializeNewsCopyWith(
          InitializeNews value, $Res Function(InitializeNews) then) =
      _$InitializeNewsCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializeNewsCopyWithImpl<$Res> extends _$NewsEventCopyWithImpl<$Res>
    implements $InitializeNewsCopyWith<$Res> {
  _$InitializeNewsCopyWithImpl(
      InitializeNews _value, $Res Function(InitializeNews) _then)
      : super(_value, (v) => _then(v as InitializeNews));

  @override
  InitializeNews get _value => super._value as InitializeNews;
}

/// @nodoc
class _$InitializeNews implements InitializeNews {
  const _$InitializeNews();

  @override
  String toString() {
    return 'NewsEvent.initializeNews()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitializeNews);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeNews(),
    @required TResult newsUpdated(List<News> newsList),
    @required TResult addNews(String content, Author author),
    @required TResult deleteNews(String id),
    @required TResult pinNews(String id),
  }) {
    assert(initializeNews != null);
    assert(newsUpdated != null);
    assert(addNews != null);
    assert(deleteNews != null);
    assert(pinNews != null);
    return initializeNews();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeNews(),
    TResult newsUpdated(List<News> newsList),
    TResult addNews(String content, Author author),
    TResult deleteNews(String id),
    TResult pinNews(String id),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initializeNews != null) {
      return initializeNews();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeNews(InitializeNews value),
    @required TResult newsUpdated(NewsUpdated value),
    @required TResult addNews(AddNews value),
    @required TResult deleteNews(DeleteNews value),
    @required TResult pinNews(PinNews value),
  }) {
    assert(initializeNews != null);
    assert(newsUpdated != null);
    assert(addNews != null);
    assert(deleteNews != null);
    assert(pinNews != null);
    return initializeNews(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeNews(InitializeNews value),
    TResult newsUpdated(NewsUpdated value),
    TResult addNews(AddNews value),
    TResult deleteNews(DeleteNews value),
    TResult pinNews(PinNews value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initializeNews != null) {
      return initializeNews(this);
    }
    return orElse();
  }
}

abstract class InitializeNews implements NewsEvent {
  const factory InitializeNews() = _$InitializeNews;
}

/// @nodoc
abstract class $NewsUpdatedCopyWith<$Res> {
  factory $NewsUpdatedCopyWith(
          NewsUpdated value, $Res Function(NewsUpdated) then) =
      _$NewsUpdatedCopyWithImpl<$Res>;
  $Res call({List<News> newsList});
}

/// @nodoc
class _$NewsUpdatedCopyWithImpl<$Res> extends _$NewsEventCopyWithImpl<$Res>
    implements $NewsUpdatedCopyWith<$Res> {
  _$NewsUpdatedCopyWithImpl(
      NewsUpdated _value, $Res Function(NewsUpdated) _then)
      : super(_value, (v) => _then(v as NewsUpdated));

  @override
  NewsUpdated get _value => super._value as NewsUpdated;

  @override
  $Res call({
    Object newsList = freezed,
  }) {
    return _then(NewsUpdated(
      newsList: newsList == freezed ? _value.newsList : newsList as List<News>,
    ));
  }
}

/// @nodoc
class _$NewsUpdated implements NewsUpdated {
  const _$NewsUpdated({@required this.newsList}) : assert(newsList != null);

  @override
  final List<News> newsList;

  @override
  String toString() {
    return 'NewsEvent.newsUpdated(newsList: $newsList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NewsUpdated &&
            (identical(other.newsList, newsList) ||
                const DeepCollectionEquality()
                    .equals(other.newsList, newsList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newsList);

  @JsonKey(ignore: true)
  @override
  $NewsUpdatedCopyWith<NewsUpdated> get copyWith =>
      _$NewsUpdatedCopyWithImpl<NewsUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeNews(),
    @required TResult newsUpdated(List<News> newsList),
    @required TResult addNews(String content, Author author),
    @required TResult deleteNews(String id),
    @required TResult pinNews(String id),
  }) {
    assert(initializeNews != null);
    assert(newsUpdated != null);
    assert(addNews != null);
    assert(deleteNews != null);
    assert(pinNews != null);
    return newsUpdated(newsList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeNews(),
    TResult newsUpdated(List<News> newsList),
    TResult addNews(String content, Author author),
    TResult deleteNews(String id),
    TResult pinNews(String id),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (newsUpdated != null) {
      return newsUpdated(newsList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeNews(InitializeNews value),
    @required TResult newsUpdated(NewsUpdated value),
    @required TResult addNews(AddNews value),
    @required TResult deleteNews(DeleteNews value),
    @required TResult pinNews(PinNews value),
  }) {
    assert(initializeNews != null);
    assert(newsUpdated != null);
    assert(addNews != null);
    assert(deleteNews != null);
    assert(pinNews != null);
    return newsUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeNews(InitializeNews value),
    TResult newsUpdated(NewsUpdated value),
    TResult addNews(AddNews value),
    TResult deleteNews(DeleteNews value),
    TResult pinNews(PinNews value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (newsUpdated != null) {
      return newsUpdated(this);
    }
    return orElse();
  }
}

abstract class NewsUpdated implements NewsEvent {
  const factory NewsUpdated({@required List<News> newsList}) = _$NewsUpdated;

  List<News> get newsList;
  @JsonKey(ignore: true)
  $NewsUpdatedCopyWith<NewsUpdated> get copyWith;
}

/// @nodoc
abstract class $AddNewsCopyWith<$Res> {
  factory $AddNewsCopyWith(AddNews value, $Res Function(AddNews) then) =
      _$AddNewsCopyWithImpl<$Res>;
  $Res call({String content, Author author});

  $AuthorCopyWith<$Res> get author;
}

/// @nodoc
class _$AddNewsCopyWithImpl<$Res> extends _$NewsEventCopyWithImpl<$Res>
    implements $AddNewsCopyWith<$Res> {
  _$AddNewsCopyWithImpl(AddNews _value, $Res Function(AddNews) _then)
      : super(_value, (v) => _then(v as AddNews));

  @override
  AddNews get _value => super._value as AddNews;

  @override
  $Res call({
    Object content = freezed,
    Object author = freezed,
  }) {
    return _then(AddNews(
      content: content == freezed ? _value.content : content as String,
      author: author == freezed ? _value.author : author as Author,
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
class _$AddNews implements AddNews {
  const _$AddNews({@required this.content, @required this.author})
      : assert(content != null),
        assert(author != null);

  @override
  final String content;
  @override
  final Author author;

  @override
  String toString() {
    return 'NewsEvent.addNews(content: $content, author: $author)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AddNews &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(author);

  @JsonKey(ignore: true)
  @override
  $AddNewsCopyWith<AddNews> get copyWith =>
      _$AddNewsCopyWithImpl<AddNews>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeNews(),
    @required TResult newsUpdated(List<News> newsList),
    @required TResult addNews(String content, Author author),
    @required TResult deleteNews(String id),
    @required TResult pinNews(String id),
  }) {
    assert(initializeNews != null);
    assert(newsUpdated != null);
    assert(addNews != null);
    assert(deleteNews != null);
    assert(pinNews != null);
    return addNews(content, author);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeNews(),
    TResult newsUpdated(List<News> newsList),
    TResult addNews(String content, Author author),
    TResult deleteNews(String id),
    TResult pinNews(String id),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (addNews != null) {
      return addNews(content, author);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeNews(InitializeNews value),
    @required TResult newsUpdated(NewsUpdated value),
    @required TResult addNews(AddNews value),
    @required TResult deleteNews(DeleteNews value),
    @required TResult pinNews(PinNews value),
  }) {
    assert(initializeNews != null);
    assert(newsUpdated != null);
    assert(addNews != null);
    assert(deleteNews != null);
    assert(pinNews != null);
    return addNews(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeNews(InitializeNews value),
    TResult newsUpdated(NewsUpdated value),
    TResult addNews(AddNews value),
    TResult deleteNews(DeleteNews value),
    TResult pinNews(PinNews value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (addNews != null) {
      return addNews(this);
    }
    return orElse();
  }
}

abstract class AddNews implements NewsEvent {
  const factory AddNews({@required String content, @required Author author}) =
      _$AddNews;

  String get content;
  Author get author;
  @JsonKey(ignore: true)
  $AddNewsCopyWith<AddNews> get copyWith;
}

/// @nodoc
abstract class $DeleteNewsCopyWith<$Res> {
  factory $DeleteNewsCopyWith(
          DeleteNews value, $Res Function(DeleteNews) then) =
      _$DeleteNewsCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$DeleteNewsCopyWithImpl<$Res> extends _$NewsEventCopyWithImpl<$Res>
    implements $DeleteNewsCopyWith<$Res> {
  _$DeleteNewsCopyWithImpl(DeleteNews _value, $Res Function(DeleteNews) _then)
      : super(_value, (v) => _then(v as DeleteNews));

  @override
  DeleteNews get _value => super._value as DeleteNews;

  @override
  $Res call({
    Object id = freezed,
  }) {
    return _then(DeleteNews(
      id: id == freezed ? _value.id : id as String,
    ));
  }
}

/// @nodoc
class _$DeleteNews implements DeleteNews {
  const _$DeleteNews({@required this.id}) : assert(id != null);

  @override
  final String id;

  @override
  String toString() {
    return 'NewsEvent.deleteNews(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeleteNews &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  $DeleteNewsCopyWith<DeleteNews> get copyWith =>
      _$DeleteNewsCopyWithImpl<DeleteNews>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeNews(),
    @required TResult newsUpdated(List<News> newsList),
    @required TResult addNews(String content, Author author),
    @required TResult deleteNews(String id),
    @required TResult pinNews(String id),
  }) {
    assert(initializeNews != null);
    assert(newsUpdated != null);
    assert(addNews != null);
    assert(deleteNews != null);
    assert(pinNews != null);
    return deleteNews(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeNews(),
    TResult newsUpdated(List<News> newsList),
    TResult addNews(String content, Author author),
    TResult deleteNews(String id),
    TResult pinNews(String id),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deleteNews != null) {
      return deleteNews(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeNews(InitializeNews value),
    @required TResult newsUpdated(NewsUpdated value),
    @required TResult addNews(AddNews value),
    @required TResult deleteNews(DeleteNews value),
    @required TResult pinNews(PinNews value),
  }) {
    assert(initializeNews != null);
    assert(newsUpdated != null);
    assert(addNews != null);
    assert(deleteNews != null);
    assert(pinNews != null);
    return deleteNews(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeNews(InitializeNews value),
    TResult newsUpdated(NewsUpdated value),
    TResult addNews(AddNews value),
    TResult deleteNews(DeleteNews value),
    TResult pinNews(PinNews value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (deleteNews != null) {
      return deleteNews(this);
    }
    return orElse();
  }
}

abstract class DeleteNews implements NewsEvent {
  const factory DeleteNews({@required String id}) = _$DeleteNews;

  String get id;
  @JsonKey(ignore: true)
  $DeleteNewsCopyWith<DeleteNews> get copyWith;
}

/// @nodoc
abstract class $PinNewsCopyWith<$Res> {
  factory $PinNewsCopyWith(PinNews value, $Res Function(PinNews) then) =
      _$PinNewsCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$PinNewsCopyWithImpl<$Res> extends _$NewsEventCopyWithImpl<$Res>
    implements $PinNewsCopyWith<$Res> {
  _$PinNewsCopyWithImpl(PinNews _value, $Res Function(PinNews) _then)
      : super(_value, (v) => _then(v as PinNews));

  @override
  PinNews get _value => super._value as PinNews;

  @override
  $Res call({
    Object id = freezed,
  }) {
    return _then(PinNews(
      id: id == freezed ? _value.id : id as String,
    ));
  }
}

/// @nodoc
class _$PinNews implements PinNews {
  const _$PinNews({@required this.id}) : assert(id != null);

  @override
  final String id;

  @override
  String toString() {
    return 'NewsEvent.pinNews(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PinNews &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  $PinNewsCopyWith<PinNews> get copyWith =>
      _$PinNewsCopyWithImpl<PinNews>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initializeNews(),
    @required TResult newsUpdated(List<News> newsList),
    @required TResult addNews(String content, Author author),
    @required TResult deleteNews(String id),
    @required TResult pinNews(String id),
  }) {
    assert(initializeNews != null);
    assert(newsUpdated != null);
    assert(addNews != null);
    assert(deleteNews != null);
    assert(pinNews != null);
    return pinNews(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initializeNews(),
    TResult newsUpdated(List<News> newsList),
    TResult addNews(String content, Author author),
    TResult deleteNews(String id),
    TResult pinNews(String id),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (pinNews != null) {
      return pinNews(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initializeNews(InitializeNews value),
    @required TResult newsUpdated(NewsUpdated value),
    @required TResult addNews(AddNews value),
    @required TResult deleteNews(DeleteNews value),
    @required TResult pinNews(PinNews value),
  }) {
    assert(initializeNews != null);
    assert(newsUpdated != null);
    assert(addNews != null);
    assert(deleteNews != null);
    assert(pinNews != null);
    return pinNews(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initializeNews(InitializeNews value),
    TResult newsUpdated(NewsUpdated value),
    TResult addNews(AddNews value),
    TResult deleteNews(DeleteNews value),
    TResult pinNews(PinNews value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (pinNews != null) {
      return pinNews(this);
    }
    return orElse();
  }
}

abstract class PinNews implements NewsEvent {
  const factory PinNews({@required String id}) = _$PinNews;

  String get id;
  @JsonKey(ignore: true)
  $PinNewsCopyWith<PinNews> get copyWith;
}
