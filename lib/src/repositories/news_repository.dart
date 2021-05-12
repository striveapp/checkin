import 'package:checkin/src/models/news.dart';

abstract class NewsRepository {
  Stream<List<News>> getAllNews(String gymId);
}
