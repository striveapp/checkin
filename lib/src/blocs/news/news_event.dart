import 'package:checkin/src/models/author.dart';
import 'package:checkin/src/models/news.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_event.freezed.dart';

@freezed
abstract class NewsEvent with _$NewsEvent {
  const factory NewsEvent.initializeNews() = InitializeNews;

  const factory NewsEvent.newsUpdated({
    @required List<News> newsList,
  }) = NewsUpdated;

  const factory NewsEvent.addNews({
    @required String content,
    @required Author author,
  }) = AddNews;

  const factory NewsEvent.deleteNews({
    @required String id,
  }) = DeleteNews;

  const factory NewsEvent.pinNews({
    @required String id,
  }) = PinNews;

  const factory NewsEvent.unpinNews({
    @required String id,
  }) = UnpinNews;
}
