// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title_detail_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebComicResult _$WebComicResultFromJson(Map<String, dynamic> json) {
  return WebComicResult(
    json['data'] == null
        ? null
        : TitleDetailResponse.fromJson(json['data'] as Map<String, dynamic>),
  )..header = json['header'] == null
      ? null
      : ApiResultHeader.fromJson(json['header'] as Map<String, dynamic>);
}

Map<String, dynamic> _$WebComicResultToJson(WebComicResult instance) =>
    <String, dynamic>{
      'header': instance.header,
      'data': instance.data,
    };
