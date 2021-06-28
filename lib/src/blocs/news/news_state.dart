import 'package:checkin/src/models/news.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'news_state.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.newsInitial() = NewsInitial;
  const factory NewsState.newsLoaded({
    required List<News> newsList,
    required bool hasPinnedNews,
    required String gymId,
  }) = NewsLoaded;
}
