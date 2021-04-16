import 'package:flutter_webtoon/domain/entity/section_entity.dart';
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

}
