import 'package:flutter_webtoon/domain/entity/title_entity.dart';

class SectionEntity {
  final String name;
  final int index;
  final TitleEntity? title1;
  final TitleEntity? title2;
  final List<TitleEntity> items;
  final String actionText;
  final String navigationActionLink;
  final String topImageThumbUrl;

  SectionEntity({
    required this.name,
    required this.index,
    this.title1,
    this.title2,
    required this.items,
    this.actionText = "",
    this.navigationActionLink = "",
    this.topImageThumbUrl = "",
  });
}
