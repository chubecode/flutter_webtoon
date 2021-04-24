// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionResponse _$SectionResponseFromJson(Map<String, dynamic> json) {
  return SectionResponse(
    name: json['name'] as String,
    index: json['index'] as int,
    title1: json['title1'] == null
        ? null
        : TitleResponse.fromJson(json['title1'] as Map<String, dynamic>),
    title2: json['title2'] == null
        ? null
        : TitleResponse.fromJson(json['title2'] as Map<String, dynamic>),
    items: (json['items'] as List<dynamic>)
        .map((e) => TitleResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    actionText: json['actionText'] as String?,
    navigationActionLink: json['navigationActionLink'] as String?,
    topImageThumbUrl: json['topImageThumbUrl'] as String?,
  );
}

Map<String, dynamic> _$SectionResponseToJson(SectionResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'index': instance.index,
      'title1': instance.title1,
      'title2': instance.title2,
      'items': instance.items,
      'actionText': instance.actionText,
      'navigationActionLink': instance.navigationActionLink,
      'topImageThumbUrl': instance.topImageThumbUrl,
    };
