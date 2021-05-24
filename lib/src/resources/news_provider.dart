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
    // todo sort by query!
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

  @override
  Future<void> pinNews(String gymId, String newsId) {
    return _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(newsId)
        .update({'isPinned': true});
  }

  @override
  Future<void> unpinNews(String gymId, String newsId) {
    return _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(newsId)
        .update({'isPinned': false});
  }

  @override
  Future<void> deleteNews(String gymId, String newsId) {
    return _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(newsId)
        .delete();
  }
}
