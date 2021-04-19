// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TitleDetailResponse _$TitleDetailResponseFromJson(Map<String, dynamic> json) {
  return TitleDetailResponse(
    id: json['id'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    author: json['author'] as String?,
    releaseDate: json['releaseDate'] as String?,
    titleType: json['titleType'] as String?,
    thumbVerticalUrl: json['thumbVerticalUrl'] as String?,
    thumbDetailUrl: json['thumbDetailUrl'] as String?,
    status: json['status'] as String?,
    readStatus: json['readStatus'] as String?,
    avgReviewScore: json['avgReviewScore'] as int?,
    numReview: json['numReview'] as int?,
    numLike: json['numLike'] as int?,
    numRead: json['numRead'] as int?,
    numComment: json['numComment'] as int?,
    numChapter: json['numChapter'] as int?,
    chapters: (json['chapters'] as List<dynamic>?)
        ?.map((e) => Chapters.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TitleDetailResponseToJson(
        TitleDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'author': instance.author,
      'releaseDate': instance.releaseDate,
      'titleType': instance.titleType,
      'thumbVerticalUrl': instance.thumbVerticalUrl,
      'thumbDetailUrl': instance.thumbDetailUrl,
      'status': instance.status,
      'readStatus': instance.readStatus,
      'avgReviewScore': instance.avgReviewScore,
      'numReview': instance.numReview,
      'numLike': instance.numLike,
      'numRead': instance.numRead,
      'numComment': instance.numComment,
      'numChapter': instance.numChapter,
      'chapters': instance.chapters,
    };
