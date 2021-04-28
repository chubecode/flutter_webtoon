import 'package:flutter_webtoon/data/remote/entities/webcomic/web_comic_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wrapped_response.g.dart';

class WrappedResponse {
  ApiResultHeader? header;
}

@JsonSerializable()
class ApiResultHeader {
  final bool? isSuccessful;
  final int? resultCode;
  final String? resultMessage;

  ApiResultHeader(
      {required this.isSuccessful,
      required this.resultCode,
      required this.resultMessage});

  factory ApiResultHeader.fromJson(Map<String, dynamic> json) =>
      _$ApiResultHeaderFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResultHeaderToJson(this);
}
