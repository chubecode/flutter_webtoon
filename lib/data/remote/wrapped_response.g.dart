// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wrapped_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResultHeader _$ApiResultHeaderFromJson(Map<String, dynamic> json) {
  return ApiResultHeader(
    isSuccessful: json['isSuccessful'] as bool?,
    resultCode: json['resultCode'] as int?,
    resultMessage: json['resultMessage'] as String?,
  );
}

Map<String, dynamic> _$ApiResultHeaderToJson(ApiResultHeader instance) =>
    <String, dynamic>{
      'isSuccessful': instance.isSuccessful,
      'resultCode': instance.resultCode,
      'resultMessage': instance.resultMessage,
    };
