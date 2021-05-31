import 'package:checkin/src/models/author.dart';
import 'package:checkin/src/models/news.dart';

abstract class NewsRepository {
  Stream<List<News>> getNews(String gymId, int limit);

  Stream<List<News>> getPaginatedNews(String gymId, int lastVisibleTimestamp, int limit);

  Future<void> publishNews(String gymId, String content, Author author);

  Future<void> pinNews(String gymId, String newsId);

  Future<void> replacePinnedNews(String gymId, String newsId);

  Future<void> unpinNews(String gymId, String newsId);

  Future<void> deleteNews(String gymId, String newsId);
}
