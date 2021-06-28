// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'news_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NewsEventTearOff {
  const _$NewsEventTearOff();

  InitializeNews initializeNews() {
    return const InitializeNews();
  }

  NewsUpdated newsUpdated(
      {required List<News> newsList, required String gymId}) {
    return NewsUpdated(
      newsList: newsList,
      gymId: gymId,
    );
  }

  AddNews addNews({required String content, required Author author}) {
    return AddNews(
      content: content,
      author: author,
    );
  }

  DeleteNews deleteNews({required String id}) {
    return DeleteNews(
      id: id,
    );
  }

  PinNews pinNews({required String id}) {
    return PinNews(
      id: id,
    );
  }

  UnpinNews unpinNews({required String id}) {
    return UnpinNews(
      id: id,
    );
  }

  ReplacePinnedNews replacePinnedNews({required String id}) {
    return ReplacePinnedNews(
      id: id,
    );
  }
}

/// @nodoc
const $NewsEvent = _$NewsEventTearOff();

/// @nodoc
mixin _$NewsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeNews,
    required TResult Function(List<News> newsList, String gymId) newsUpdated,
    required TResult Function(String content, Author author) addNews,
    required TResult Function(String id) deleteNews,
    required TResult Function(String id) pinNews,
    required TResult Function(String id) unpinNews,
    required TResult Function(String id) replacePinnedNews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeNews,
    TResult Function(List<News> newsList, String gymId)? newsUpdated,
    TResult Function(String content, Author author)? addNews,
    TResult Function(String id)? deleteNews,
    TResult Function(String id)? pinNews,
    TResult Function(String id)? unpinNews,
    TResult Function(String id)? replacePinnedNews,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeNews value) initializeNews,
    required TResult Function(NewsUpdated value) newsUpdated,
    required TResult Function(AddNews value) addNews,
    required TResult Function(DeleteNews value) deleteNews,
    required TResult Function(PinNews value) pinNews,
    required TResult Function(UnpinNews value) unpinNews,
    required TResult Function(ReplacePinnedNews value) replacePinnedNews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeNews value)? initializeNews,
    TResult Function(NewsUpdated value)? newsUpdated,
    TResult Function(AddNews value)? addNews,
    TResult Function(DeleteNews value)? deleteNews,
    TResult Function(PinNews value)? pinNews,
    TResult Function(UnpinNews value)? unpinNews,
    TResult Function(ReplacePinnedNews value)? replacePinnedNews,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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
  TResult when<TResult extends Object?>({
    required TResult Function() initializeNews,
    required TResult Function(List<News> newsList, String gymId) newsUpdated,
    required TResult Function(String content, Author author) addNews,
    required TResult Function(String id) deleteNews,
    required TResult Function(String id) pinNews,
    required TResult Function(String id) unpinNews,
    required TResult Function(String id) replacePinnedNews,
  }) {
    return initializeNews();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeNews,
    TResult Function(List<News> newsList, String gymId)? newsUpdated,
    TResult Function(String content, Author author)? addNews,
    TResult Function(String id)? deleteNews,
    TResult Function(String id)? pinNews,
    TResult Function(String id)? unpinNews,
    TResult Function(String id)? replacePinnedNews,
    required TResult orElse(),
  }) {
    if (initializeNews != null) {
      return initializeNews();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeNews value) initializeNews,
    required TResult Function(NewsUpdated value) newsUpdated,
    required TResult Function(AddNews value) addNews,
    required TResult Function(DeleteNews value) deleteNews,
    required TResult Function(PinNews value) pinNews,
    required TResult Function(UnpinNews value) unpinNews,
    required TResult Function(ReplacePinnedNews value) replacePinnedNews,
  }) {
    return initializeNews(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeNews value)? initializeNews,
    TResult Function(NewsUpdated value)? newsUpdated,
    TResult Function(AddNews value)? addNews,
    TResult Function(DeleteNews value)? deleteNews,
    TResult Function(PinNews value)? pinNews,
    TResult Function(UnpinNews value)? unpinNews,
    TResult Function(ReplacePinnedNews value)? replacePinnedNews,
    required TResult orElse(),
  }) {
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
  $Res call({List<News> newsList, String gymId});
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
    Object? newsList = freezed,
    Object? gymId = freezed,
  }) {
    return _then(NewsUpdated(
      newsList: newsList == freezed
          ? _value.newsList
          : newsList // ignore: cast_nullable_to_non_nullable
              as List<News>,
      gymId: gymId == freezed
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NewsUpdated implements NewsUpdated {
  const _$NewsUpdated({required this.newsList, required this.gymId});

  @override
  final List<News> newsList;
  @override
  final String gymId;

  @override
  String toString() {
    return 'NewsEvent.newsUpdated(newsList: $newsList, gymId: $gymId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NewsUpdated &&
            (identical(other.newsList, newsList) ||
                const DeepCollectionEquality()
                    .equals(other.newsList, newsList)) &&
            (identical(other.gymId, gymId) ||
                const DeepCollectionEquality().equals(other.gymId, gymId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(newsList) ^
      const DeepCollectionEquality().hash(gymId);

  @JsonKey(ignore: true)
  @override
  $NewsUpdatedCopyWith<NewsUpdated> get copyWith =>
      _$NewsUpdatedCopyWithImpl<NewsUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeNews,
    required TResult Function(List<News> newsList, String gymId) newsUpdated,
    required TResult Function(String content, Author author) addNews,
    required TResult Function(String id) deleteNews,
    required TResult Function(String id) pinNews,
    required TResult Function(String id) unpinNews,
    required TResult Function(String id) replacePinnedNews,
  }) {
    return newsUpdated(newsList, gymId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeNews,
    TResult Function(List<News> newsList, String gymId)? newsUpdated,
    TResult Function(String content, Author author)? addNews,
    TResult Function(String id)? deleteNews,
    TResult Function(String id)? pinNews,
    TResult Function(String id)? unpinNews,
    TResult Function(String id)? replacePinnedNews,
    required TResult orElse(),
  }) {
    if (newsUpdated != null) {
      return newsUpdated(newsList, gymId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeNews value) initializeNews,
    required TResult Function(NewsUpdated value) newsUpdated,
    required TResult Function(AddNews value) addNews,
    required TResult Function(DeleteNews value) deleteNews,
    required TResult Function(PinNews value) pinNews,
    required TResult Function(UnpinNews value) unpinNews,
    required TResult Function(ReplacePinnedNews value) replacePinnedNews,
  }) {
    return newsUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeNews value)? initializeNews,
    TResult Function(NewsUpdated value)? newsUpdated,
    TResult Function(AddNews value)? addNews,
    TResult Function(DeleteNews value)? deleteNews,
    TResult Function(PinNews value)? pinNews,
    TResult Function(UnpinNews value)? unpinNews,
    TResult Function(ReplacePinnedNews value)? replacePinnedNews,
    required TResult orElse(),
  }) {
    if (newsUpdated != null) {
      return newsUpdated(this);
    }
    return orElse();
  }
}

abstract class NewsUpdated implements NewsEvent {
  const factory NewsUpdated(
      {required List<News> newsList, required String gymId}) = _$NewsUpdated;

  List<News> get newsList => throw _privateConstructorUsedError;
  String get gymId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsUpdatedCopyWith<NewsUpdated> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? content = freezed,
    Object? author = freezed,
  }) {
    return _then(AddNews(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as Author,
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

class _$AddNews implements AddNews {
  const _$AddNews({required this.content, required this.author});

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
  TResult when<TResult extends Object?>({
    required TResult Function() initializeNews,
    required TResult Function(List<News> newsList, String gymId) newsUpdated,
    required TResult Function(String content, Author author) addNews,
    required TResult Function(String id) deleteNews,
    required TResult Function(String id) pinNews,
    required TResult Function(String id) unpinNews,
    required TResult Function(String id) replacePinnedNews,
  }) {
    return addNews(content, author);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeNews,
    TResult Function(List<News> newsList, String gymId)? newsUpdated,
    TResult Function(String content, Author author)? addNews,
    TResult Function(String id)? deleteNews,
    TResult Function(String id)? pinNews,
    TResult Function(String id)? unpinNews,
    TResult Function(String id)? replacePinnedNews,
    required TResult orElse(),
  }) {
    if (addNews != null) {
      return addNews(content, author);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeNews value) initializeNews,
    required TResult Function(NewsUpdated value) newsUpdated,
    required TResult Function(AddNews value) addNews,
    required TResult Function(DeleteNews value) deleteNews,
    required TResult Function(PinNews value) pinNews,
    required TResult Function(UnpinNews value) unpinNews,
    required TResult Function(ReplacePinnedNews value) replacePinnedNews,
  }) {
    return addNews(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeNews value)? initializeNews,
    TResult Function(NewsUpdated value)? newsUpdated,
    TResult Function(AddNews value)? addNews,
    TResult Function(DeleteNews value)? deleteNews,
    TResult Function(PinNews value)? pinNews,
    TResult Function(UnpinNews value)? unpinNews,
    TResult Function(ReplacePinnedNews value)? replacePinnedNews,
    required TResult orElse(),
  }) {
    if (addNews != null) {
      return addNews(this);
    }
    return orElse();
  }
}

abstract class AddNews implements NewsEvent {
  const factory AddNews({required String content, required Author author}) =
      _$AddNews;

  String get content => throw _privateConstructorUsedError;
  Author get author => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddNewsCopyWith<AddNews> get copyWith => throw _privateConstructorUsedError;
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
    Object? id = freezed,
  }) {
    return _then(DeleteNews(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteNews implements DeleteNews {
  const _$DeleteNews({required this.id});

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
  TResult when<TResult extends Object?>({
    required TResult Function() initializeNews,
    required TResult Function(List<News> newsList, String gymId) newsUpdated,
    required TResult Function(String content, Author author) addNews,
    required TResult Function(String id) deleteNews,
    required TResult Function(String id) pinNews,
    required TResult Function(String id) unpinNews,
    required TResult Function(String id) replacePinnedNews,
  }) {
    return deleteNews(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeNews,
    TResult Function(List<News> newsList, String gymId)? newsUpdated,
    TResult Function(String content, Author author)? addNews,
    TResult Function(String id)? deleteNews,
    TResult Function(String id)? pinNews,
    TResult Function(String id)? unpinNews,
    TResult Function(String id)? replacePinnedNews,
    required TResult orElse(),
  }) {
    if (deleteNews != null) {
      return deleteNews(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeNews value) initializeNews,
    required TResult Function(NewsUpdated value) newsUpdated,
    required TResult Function(AddNews value) addNews,
    required TResult Function(DeleteNews value) deleteNews,
    required TResult Function(PinNews value) pinNews,
    required TResult Function(UnpinNews value) unpinNews,
    required TResult Function(ReplacePinnedNews value) replacePinnedNews,
  }) {
    return deleteNews(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeNews value)? initializeNews,
    TResult Function(NewsUpdated value)? newsUpdated,
    TResult Function(AddNews value)? addNews,
    TResult Function(DeleteNews value)? deleteNews,
    TResult Function(PinNews value)? pinNews,
    TResult Function(UnpinNews value)? unpinNews,
    TResult Function(ReplacePinnedNews value)? replacePinnedNews,
    required TResult orElse(),
  }) {
    if (deleteNews != null) {
      return deleteNews(this);
    }
    return orElse();
  }
}

abstract class DeleteNews implements NewsEvent {
  const factory DeleteNews({required String id}) = _$DeleteNews;

  String get id => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteNewsCopyWith<DeleteNews> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? id = freezed,
  }) {
    return _then(PinNews(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PinNews implements PinNews {
  const _$PinNews({required this.id});

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
  TResult when<TResult extends Object?>({
    required TResult Function() initializeNews,
    required TResult Function(List<News> newsList, String gymId) newsUpdated,
    required TResult Function(String content, Author author) addNews,
    required TResult Function(String id) deleteNews,
    required TResult Function(String id) pinNews,
    required TResult Function(String id) unpinNews,
    required TResult Function(String id) replacePinnedNews,
  }) {
    return pinNews(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeNews,
    TResult Function(List<News> newsList, String gymId)? newsUpdated,
    TResult Function(String content, Author author)? addNews,
    TResult Function(String id)? deleteNews,
    TResult Function(String id)? pinNews,
    TResult Function(String id)? unpinNews,
    TResult Function(String id)? replacePinnedNews,
    required TResult orElse(),
  }) {
    if (pinNews != null) {
      return pinNews(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeNews value) initializeNews,
    required TResult Function(NewsUpdated value) newsUpdated,
    required TResult Function(AddNews value) addNews,
    required TResult Function(DeleteNews value) deleteNews,
    required TResult Function(PinNews value) pinNews,
    required TResult Function(UnpinNews value) unpinNews,
    required TResult Function(ReplacePinnedNews value) replacePinnedNews,
  }) {
    return pinNews(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeNews value)? initializeNews,
    TResult Function(NewsUpdated value)? newsUpdated,
    TResult Function(AddNews value)? addNews,
    TResult Function(DeleteNews value)? deleteNews,
    TResult Function(PinNews value)? pinNews,
    TResult Function(UnpinNews value)? unpinNews,
    TResult Function(ReplacePinnedNews value)? replacePinnedNews,
    required TResult orElse(),
  }) {
    if (pinNews != null) {
      return pinNews(this);
    }
    return orElse();
  }
}

abstract class PinNews implements NewsEvent {
  const factory PinNews({required String id}) = _$PinNews;

  String get id => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PinNewsCopyWith<PinNews> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnpinNewsCopyWith<$Res> {
  factory $UnpinNewsCopyWith(UnpinNews value, $Res Function(UnpinNews) then) =
      _$UnpinNewsCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$UnpinNewsCopyWithImpl<$Res> extends _$NewsEventCopyWithImpl<$Res>
    implements $UnpinNewsCopyWith<$Res> {
  _$UnpinNewsCopyWithImpl(UnpinNews _value, $Res Function(UnpinNews) _then)
      : super(_value, (v) => _then(v as UnpinNews));

  @override
  UnpinNews get _value => super._value as UnpinNews;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(UnpinNews(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnpinNews implements UnpinNews {
  const _$UnpinNews({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'NewsEvent.unpinNews(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UnpinNews &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  $UnpinNewsCopyWith<UnpinNews> get copyWith =>
      _$UnpinNewsCopyWithImpl<UnpinNews>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeNews,
    required TResult Function(List<News> newsList, String gymId) newsUpdated,
    required TResult Function(String content, Author author) addNews,
    required TResult Function(String id) deleteNews,
    required TResult Function(String id) pinNews,
    required TResult Function(String id) unpinNews,
    required TResult Function(String id) replacePinnedNews,
  }) {
    return unpinNews(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeNews,
    TResult Function(List<News> newsList, String gymId)? newsUpdated,
    TResult Function(String content, Author author)? addNews,
    TResult Function(String id)? deleteNews,
    TResult Function(String id)? pinNews,
    TResult Function(String id)? unpinNews,
    TResult Function(String id)? replacePinnedNews,
    required TResult orElse(),
  }) {
    if (unpinNews != null) {
      return unpinNews(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeNews value) initializeNews,
    required TResult Function(NewsUpdated value) newsUpdated,
    required TResult Function(AddNews value) addNews,
    required TResult Function(DeleteNews value) deleteNews,
    required TResult Function(PinNews value) pinNews,
    required TResult Function(UnpinNews value) unpinNews,
    required TResult Function(ReplacePinnedNews value) replacePinnedNews,
  }) {
    return unpinNews(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeNews value)? initializeNews,
    TResult Function(NewsUpdated value)? newsUpdated,
    TResult Function(AddNews value)? addNews,
    TResult Function(DeleteNews value)? deleteNews,
    TResult Function(PinNews value)? pinNews,
    TResult Function(UnpinNews value)? unpinNews,
    TResult Function(ReplacePinnedNews value)? replacePinnedNews,
    required TResult orElse(),
  }) {
    if (unpinNews != null) {
      return unpinNews(this);
    }
    return orElse();
  }
}

abstract class UnpinNews implements NewsEvent {
  const factory UnpinNews({required String id}) = _$UnpinNews;

  String get id => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnpinNewsCopyWith<UnpinNews> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReplacePinnedNewsCopyWith<$Res> {
  factory $ReplacePinnedNewsCopyWith(
          ReplacePinnedNews value, $Res Function(ReplacePinnedNews) then) =
      _$ReplacePinnedNewsCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$ReplacePinnedNewsCopyWithImpl<$Res>
    extends _$NewsEventCopyWithImpl<$Res>
    implements $ReplacePinnedNewsCopyWith<$Res> {
  _$ReplacePinnedNewsCopyWithImpl(
      ReplacePinnedNews _value, $Res Function(ReplacePinnedNews) _then)
      : super(_value, (v) => _then(v as ReplacePinnedNews));

  @override
  ReplacePinnedNews get _value => super._value as ReplacePinnedNews;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(ReplacePinnedNews(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReplacePinnedNews implements ReplacePinnedNews {
  const _$ReplacePinnedNews({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'NewsEvent.replacePinnedNews(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReplacePinnedNews &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  $ReplacePinnedNewsCopyWith<ReplacePinnedNews> get copyWith =>
      _$ReplacePinnedNewsCopyWithImpl<ReplacePinnedNews>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeNews,
    required TResult Function(List<News> newsList, String gymId) newsUpdated,
    required TResult Function(String content, Author author) addNews,
    required TResult Function(String id) deleteNews,
    required TResult Function(String id) pinNews,
    required TResult Function(String id) unpinNews,
    required TResult Function(String id) replacePinnedNews,
  }) {
    return replacePinnedNews(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeNews,
    TResult Function(List<News> newsList, String gymId)? newsUpdated,
    TResult Function(String content, Author author)? addNews,
    TResult Function(String id)? deleteNews,
    TResult Function(String id)? pinNews,
    TResult Function(String id)? unpinNews,
    TResult Function(String id)? replacePinnedNews,
    required TResult orElse(),
  }) {
    if (replacePinnedNews != null) {
      return replacePinnedNews(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeNews value) initializeNews,
    required TResult Function(NewsUpdated value) newsUpdated,
    required TResult Function(AddNews value) addNews,
    required TResult Function(DeleteNews value) deleteNews,
    required TResult Function(PinNews value) pinNews,
    required TResult Function(UnpinNews value) unpinNews,
    required TResult Function(ReplacePinnedNews value) replacePinnedNews,
  }) {
    return replacePinnedNews(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeNews value)? initializeNews,
    TResult Function(NewsUpdated value)? newsUpdated,
    TResult Function(AddNews value)? addNews,
    TResult Function(DeleteNews value)? deleteNews,
    TResult Function(PinNews value)? pinNews,
    TResult Function(UnpinNews value)? unpinNews,
    TResult Function(ReplacePinnedNews value)? replacePinnedNews,
    required TResult orElse(),
  }) {
    if (replacePinnedNews != null) {
      return replacePinnedNews(this);
    }
    return orElse();
  }
}

abstract class ReplacePinnedNews implements NewsEvent {
  const factory ReplacePinnedNews({required String id}) = _$ReplacePinnedNews;

  String get id => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReplacePinnedNewsCopyWith<ReplacePinnedNews> get copyWith =>
      throw _privateConstructorUsedError;
}
