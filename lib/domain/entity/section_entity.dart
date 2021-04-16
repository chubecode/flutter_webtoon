import 'package:flutter_webtoon/domain/entity/section_item_entity.dart';

class SectionEntity {
  final String? name;
  final int? index;
  final SectionItemEntity? title1;
  final SectionItemEntity? title2;
  final List<SectionItemEntity> items;
  final String? actionText;
  final String? navigationActionLink;
  final String? topImageThumbUrl;

  SectionEntity({
    this.name,
    this.index,
    this.title1,
    this.title2,
    required this.items,
    this.actionText = "",
    this.navigationActionLink = "",
    this.topImageThumbUrl = "",
  });
}
