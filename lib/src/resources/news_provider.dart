import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/author.dart';
import 'package:checkin/src/models/news.dart';
import 'package:checkin/src/repositories/news_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsProvider implements NewsRepository {
  static const String gymPath = "gyms";
  static const String path = 'news';

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<News>> getNews(String gymId, int limit) {
    return _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .orderBy("timestamp", descending: true)
        .limit(limit)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => News.fromJson(doc.data())).toList());
  }

  @override
  Stream<List<News>> getPaginatedNews(String gymId, int lastVisibleTimestamp, int limit) {
    return _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .orderBy("timestamp", descending: true)
        .limit(limit)
        .startAfter([lastVisibleTimestamp])
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
    return _firestore.collection(gymPath).doc(gymId).collection(path).doc(newsId).delete();
  }

  @override
  Future<void> replacePinnedNews(String gymId, String newsId) async {
    Logger.log.i("Find pinned news in $gymId");
    var querySnapshot = await _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .where("isPinned", isEqualTo: true)
        .get();

    List<DocumentReference> pinnedNewsRefs =
        querySnapshot.docs.map((doc) => doc.reference).toList();

    var batch = _firestore.batch();
    _unpinNews(pinnedNewsRefs, batch);
    _pinNews(newsId, gymId, batch);
    batch.commit();
  }

  void _pinNews(String newsId, String gymId, WriteBatch batch) {
    Logger.log.i("News to pin [$newsId]");
    DocumentReference newsToPinRef =
        _firestore.collection(gymPath).doc(gymId).collection(path).doc(newsId);

    batch.set(
        newsToPinRef,
        {
          "isPinned": true,
        },
        SetOptions(merge: true));
  }

  void _unpinNews(List<DocumentReference> pinnedNewsRefs, WriteBatch batch) {
    for (DocumentReference pinnedNewsRef in pinnedNewsRefs) {
      Logger.log.i("Unpin pinned news [${pinnedNewsRef.id}]");
      batch.set(
        pinnedNewsRef,
        {
          "isPinned": false,
        },
        SetOptions(merge: true),
      );
    }
  }
}
