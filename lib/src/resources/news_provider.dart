import 'package:checkin/src/models/author.dart';
import 'package:checkin/src/models/news.dart';
import 'package:checkin/src/repositories/news_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsProvider implements NewsRepository {
  static const String gymPath = "gyms";
  static const String path = 'news';

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<News>> getAllNews(String gymId) {
    return _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => News.fromJson(doc.data())).toList());
  }

  @override
  Future<void> publishNews(String gymId, String content, Author author) {
    var news = News.create(content, author);
    return _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(news.id)
        .set(news.toJson());
  }
}
