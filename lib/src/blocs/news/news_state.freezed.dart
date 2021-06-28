// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'news_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NewsStateTearOff {
  const _$NewsStateTearOff();

  NewsInitial newsInitial() {
    return const NewsInitial();
  }

  NewsLoaded newsLoaded(
      {required List<News> newsList,
      required bool hasPinnedNews,
      required String gymId}) {
    return NewsLoaded(
      newsList: newsList,
      hasPinnedNews: hasPinnedNews,
      gymId: gymId,
    );
  }
}

/// @nodoc
const $NewsState = _$NewsStateTearOff();

/// @nodoc
mixin _$NewsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() newsInitial,
    required TResult Function(
            List<News> newsList, bool hasPinnedNews, String gymId)
        newsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? newsInitial,
    TResult Function(List<News> newsList, bool hasPinnedNews, String gymId)?
        newsLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsInitial value) newsInitial,
    required TResult Function(NewsLoaded value) newsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsInitial value)? newsInitial,
    TResult Function(NewsLoaded value)? newsLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res> implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  final NewsState _value;
  // ignore: unused_field
  final $Res Function(NewsState) _then;
}

/// @nodoc
abstract class $NewsInitialCopyWith<$Res> {
  factory $NewsInitialCopyWith(
          NewsInitial value, $Res Function(NewsInitial) then) =
      _$NewsInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$NewsInitialCopyWithImpl<$Res> extends _$NewsStateCopyWithImpl<$Res>
    implements $NewsInitialCopyWith<$Res> {
  _$NewsInitialCopyWithImpl(
      NewsInitial _value, $Res Function(NewsInitial) _then)
      : super(_value, (v) => _then(v as NewsInitial));

  @override
  NewsInitial get _value => super._value as NewsInitial;
}

/// @nodoc

class _$NewsInitial with DiagnosticableTreeMixin implements NewsInitial {
  const _$NewsInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NewsState.newsInitial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'NewsState.newsInitial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NewsInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() newsInitial,
    required TResult Function(
            List<News> newsList, bool hasPinnedNews, String gymId)
        newsLoaded,
  }) {
    return newsInitial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? newsInitial,
    TResult Function(List<News> newsList, bool hasPinnedNews, String gymId)?
        newsLoaded,
    required TResult orElse(),
  }) {
    if (newsInitial != null) {
      return newsInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsInitial value) newsInitial,
    required TResult Function(NewsLoaded value) newsLoaded,
  }) {
    return newsInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsInitial value)? newsInitial,
    TResult Function(NewsLoaded value)? newsLoaded,
    required TResult orElse(),
  }) {
    if (newsInitial != null) {
      return newsInitial(this);
    }
    return orElse();
  }
}

abstract class NewsInitial implements NewsState {
  const factory NewsInitial() = _$NewsInitial;
}

/// @nodoc
abstract class $NewsLoadedCopyWith<$Res> {
  factory $NewsLoadedCopyWith(
          NewsLoaded value, $Res Function(NewsLoaded) then) =
      _$NewsLoadedCopyWithImpl<$Res>;
  $Res call({List<News> newsList, bool hasPinnedNews, String gymId});
}

/// @nodoc
class _$NewsLoadedCopyWithImpl<$Res> extends _$NewsStateCopyWithImpl<$Res>
    implements $NewsLoadedCopyWith<$Res> {
  _$NewsLoadedCopyWithImpl(NewsLoaded _value, $Res Function(NewsLoaded) _then)
      : super(_value, (v) => _then(v as NewsLoaded));

  @override
  NewsLoaded get _value => super._value as NewsLoaded;

  @override
  $Res call({
    Object? newsList = freezed,
    Object? hasPinnedNews = freezed,
    Object? gymId = freezed,
  }) {
    return _then(NewsLoaded(
      newsList: newsList == freezed
          ? _value.newsList
          : newsList // ignore: cast_nullable_to_non_nullable
              as List<News>,
      hasPinnedNews: hasPinnedNews == freezed
          ? _value.hasPinnedNews
          : hasPinnedNews // ignore: cast_nullable_to_non_nullable
              as bool,
      gymId: gymId == freezed
          ? _value.gymId
          : gymId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NewsLoaded with DiagnosticableTreeMixin implements NewsLoaded {
  const _$NewsLoaded(
      {required this.newsList,
      required this.hasPinnedNews,
      required this.gymId});

  @override
  final List<News> newsList;
  @override
  final bool hasPinnedNews;
  @override
  final String gymId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NewsState.newsLoaded(newsList: $newsList, hasPinnedNews: $hasPinnedNews, gymId: $gymId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NewsState.newsLoaded'))
      ..add(DiagnosticsProperty('newsList', newsList))
      ..add(DiagnosticsProperty('hasPinnedNews', hasPinnedNews))
      ..add(DiagnosticsProperty('gymId', gymId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NewsLoaded &&
            (identical(other.newsList, newsList) ||
                const DeepCollectionEquality()
                    .equals(other.newsList, newsList)) &&
            (identical(other.hasPinnedNews, hasPinnedNews) ||
                const DeepCollectionEquality()
                    .equals(other.hasPinnedNews, hasPinnedNews)) &&
            (identical(other.gymId, gymId) ||
                const DeepCollectionEquality().equals(other.gymId, gymId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(newsList) ^
      const DeepCollectionEquality().hash(hasPinnedNews) ^
      const DeepCollectionEquality().hash(gymId);

  @JsonKey(ignore: true)
  @override
  $NewsLoadedCopyWith<NewsLoaded> get copyWith =>
      _$NewsLoadedCopyWithImpl<NewsLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() newsInitial,
    required TResult Function(
            List<News> newsList, bool hasPinnedNews, String gymId)
        newsLoaded,
  }) {
    return newsLoaded(newsList, hasPinnedNews, gymId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? newsInitial,
    TResult Function(List<News> newsList, bool hasPinnedNews, String gymId)?
        newsLoaded,
    required TResult orElse(),
  }) {
    if (newsLoaded != null) {
      return newsLoaded(newsList, hasPinnedNews, gymId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewsInitial value) newsInitial,
    required TResult Function(NewsLoaded value) newsLoaded,
  }) {
    return newsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewsInitial value)? newsInitial,
    TResult Function(NewsLoaded value)? newsLoaded,
    required TResult orElse(),
  }) {
    if (newsLoaded != null) {
      return newsLoaded(this);
    }
    return orElse();
  }
}

abstract class NewsLoaded implements NewsState {
  const factory NewsLoaded(
      {required List<News> newsList,
      required bool hasPinnedNews,
      required String gymId}) = _$NewsLoaded;

  List<News> get newsList => throw _privateConstructorUsedError;
  bool get hasPinnedNews => throw _privateConstructorUsedError;
  String get gymId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsLoadedCopyWith<NewsLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
