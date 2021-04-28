import 'package:flutter_webtoon/data/remote/entities/webcomic/web_comic_response.dart';
import 'package:flutter_webtoon/data/remote/wrapped_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'web_comic_result.g.dart';

@JsonSerializable()
class WebComicResult extends WrappedResponse {
  final WebComicResponse? data;

  factory WebComicResult.fromJson(Map<String, dynamic> json) =>
      _$WebComicResultFromJson(json);

  WebComicResult(this.data);
  Map<String, dynamic> toJson() => _$WebComicResultToJson(this);
}
