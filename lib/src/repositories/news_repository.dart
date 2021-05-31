import 'package:checkin/src/models/author.dart';
import 'package:checkin/src/models/news.dart';

abstract class NewsRepository {
  //TODO: increase the page size
  Stream<List<News>> getNews(String gymId, [int endAt]);

  Future<void> publishNews(String gymId, String content, Author author);

  Future<void> pinNews(String gymId, String newsId);

  Future<void> replacePinnedNews(String gymId, String newsId);

  Future<void> unpinNews(String gymId, String newsId);

  Future<void> deleteNews(String gymId, String newsId);
}
