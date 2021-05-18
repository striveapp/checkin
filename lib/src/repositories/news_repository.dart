import 'package:checkin/src/models/author.dart';
import 'package:checkin/src/models/news.dart';

abstract class NewsRepository {
  Stream<List<News>> getAllNews(String gymId);

  Future<void> publishNews(String gymId, String content, Author author);
}
