import 'package:checkin/src/models/news.dart';
import 'package:checkin/src/repositories/news_repository.dart';

class NewsProvider implements NewsRepository {
  @override
  Stream<List<News>> getAllNews(String gymId) {
    // TODO: implement getAllNews
    throw UnimplementedError();
  }
}
