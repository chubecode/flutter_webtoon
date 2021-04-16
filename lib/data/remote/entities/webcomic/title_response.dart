import 'package:json_annotation/json_annotation.dart';
part 'title_response.g.dart';

@JsonSerializable()
class TitleResponse {
  final String? deeplink;
  final String? name;
  final String? thumb;

  TitleResponse({
    this.deeplink,
    this.name,
    this.thumb,
  });

  factory TitleResponse.fromJson(Map<String, dynamic> json) => _$TitleResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TitleResponseToJson(this);


}
