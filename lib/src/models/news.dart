import 'package:checkin/src/models/author.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.freezed.dart';
part 'news.g.dart';

@freezed
abstract class News with _$News {
  factory News({
    @required final String id,
    @required final String content,
    @required final Author author,
    @required final int timestamp,
    @required final bool isPinned,
    final String imageUrl,
  }) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}
