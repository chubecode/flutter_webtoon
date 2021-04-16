// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_comic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebComicResponse _$WebComicResponseFromJson(Map<String, dynamic> json) {
  return WebComicResponse(
    sections: (json['sections'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : SectionResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    actionbarSections: (json['actionbarSections'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : SectionResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    rankingSections: (json['rankingSections'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : SectionResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    sliderSections: (json['sliderSections'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : SectionResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$WebComicResponseToJson(WebComicResponse instance) =>
    <String, dynamic>{
      'sections': instance.sections,
      'actionbarSections': instance.actionbarSections,
      'rankingSections': instance.rankingSections,
      'sliderSections': instance.sliderSections,
    };
