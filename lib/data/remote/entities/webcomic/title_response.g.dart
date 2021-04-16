// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TitleResponse _$TitleResponseFromJson(Map<String, dynamic> json) {
  return TitleResponse(
    deeplink: json['deeplink'] as String?,
    name: json['name'] as String?,
    thumb: json['thumb'] as String?,
  );
}

Map<String, dynamic> _$TitleResponseToJson(TitleResponse instance) =>
    <String, dynamic>{
      'deeplink': instance.deeplink,
      'name': instance.name,
      'thumb': instance.thumb,
    };
