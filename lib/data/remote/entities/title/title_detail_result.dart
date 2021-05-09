import 'package:flutter_webtoon/data/remote/entities/title/title_detail_response.dart';
import 'package:flutter_webtoon/data/remote/wrapped_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'title_detail_result.g.dart';

@JsonSerializable()
class WebComicResult extends WrappedResponse {
  final TitleDetailResponse? data;

  factory WebComicResult.fromJson(Map<String, dynamic> json) =>
      _$WebComicResultFromJson(json);

  WebComicResult(this.data);
  Map<String, dynamic> toJson() => _$WebComicResultToJson(this);
}