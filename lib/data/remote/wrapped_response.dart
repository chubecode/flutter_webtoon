import 'package:json_annotation/json_annotation.dart';
part 'wrapped_response.g.dart';
@JsonSerializable()
class WrappedResponse<T>{
  final T data;
  final ApiResultHeader header;

  WrappedResponse({required this.data,required this.header});

  factory WrappedResponse.fromJson(Map<String, dynamic> json) => _$WrappedResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WrappedResponseToJson(this);

}

@JsonSerializable()
class ApiResultHeader {
  final bool? isSuccessful;
  final int? resultCode;
  final String? resultMessage;

  ApiResultHeader(
      {required this.isSuccessful,required this.resultCode,required this.resultMessage});

  factory ApiResultHeader.fromJson(Map<String, dynamic> json) => _$ApiResultHeaderFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResultHeaderToJson(this);
}