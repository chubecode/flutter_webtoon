import 'package:flutter_webtoon/domain/entity/section_entity.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class WebComicEntity {
  final List<SectionEntity> sections;
  final List<SectionEntity> actionbarSections;
  final List<SectionEntity> rankingSections;
  final List<SectionEntity> sliderSections;

  WebComicEntity({
    required this.sections,
    required this.actionbarSections,
    required this.rankingSections,
    required this.sliderSections,
  });

  factory WebComicEntity.fromJson(Map<String, dynamic> json) {
    return WebComicEntity(
        sections: json['sections'],
        actionbarSections: json['actionbarSections'],
        rankingSections: json['rankingSections'],
        sliderSections: json['sliderSections']);
  }
}
