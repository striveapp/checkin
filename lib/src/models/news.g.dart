// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_News _$_$_NewsFromJson(Map<String, dynamic> json) {
  return _$_News(
    id: json['id'] as String,
    content: json['content'] as String,
    author: Author.fromJson(json['author'] as Map<String, dynamic>),
    timestamp: json['timestamp'] as int,
    isPinned: json['isPinned'] as bool,
    imageUrl: json['imageUrl'] as String?,
  );
}

Map<String, dynamic> _$_$_NewsToJson(_$_News instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'author': instance.author.toJson(),
      'timestamp': instance.timestamp,
      'isPinned': instance.isPinned,
      'imageUrl': instance.imageUrl,
    };
