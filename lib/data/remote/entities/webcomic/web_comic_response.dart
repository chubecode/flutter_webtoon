import 'package:flutter_webtoon/data/remote/entities/webcomic/section_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'web_comic_response.g.dart';
@JsonSerializable()
class WebComicResponse {
  final List<SectionResponse?>? sections;
  final List<SectionResponse?>? actionbarSections;
  final List<SectionResponse?>? rankingSections;
  final List<SectionResponse?>? sliderSections;

  WebComicResponse({
    this.sections,
    this.actionbarSections,
    this.rankingSections,
    this.sliderSections,
  });


  factory WebComicResponse.fromJson(Map<String, dynamic> json) => _$WebComicResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WebComicResponseToJson(this);

}