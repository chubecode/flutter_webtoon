// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapters _$ChaptersFromJson(Map<String, dynamic> json) {
  return Chapters(
    id: json['id'] as String?,
    name: json['name'] as String?,
    releaseDate: json['releaseDate'] as String?,
    numLike: json['numLike'] as int?,
    numRead: json['numRead'] as int?,
    numComment: json['numComment'] as int?,
  );
}

Map<String, dynamic> _$ChaptersToJson(Chapters instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'releaseDate': instance.releaseDate,
      'numLike': instance.numLike,
      'numRead': instance.numRead,
      'numComment': instance.numComment,
    };
