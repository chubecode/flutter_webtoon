import 'package:flutter_webtoon/data/remote/entities/webcomic/title_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'section_response.g.dart';
@JsonSerializable()
class SectionResponse {
  final String name;
  final int index;
  final TitleResponse? title1;
  final TitleResponse? title2;
  final List<TitleResponse> items;
  final String? actionText;
  final String? navigationActionLink;
  final String? topImageThumbUrl;

  SectionResponse({
    required this.name,
    required this.index,
    this.title1,
    this.title2,
    required this.items,
    this.actionText = "",
    this.navigationActionLink = "",
    this.topImageThumbUrl = "",
  });


  factory SectionResponse.fromJson(Map<String, dynamic> json) => _$SectionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SectionResponseToJson(this);
}
