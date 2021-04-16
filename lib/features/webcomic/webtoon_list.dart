import 'package:cached_network_image/cached_network_image.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webtoon/common/extension/extension.dart';
import 'package:flutter_webtoon/domain/entity/section_entity.dart';

class WebtoonList extends StatelessWidget {
  const WebtoonList({
    Key? key,
    required this.sections,
  }) : super(key: key);

  final List<SectionEntity> sections;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(sections.first.name.defaultEmpty()),
            Text(
              sections.first.actionText.defaultEmpty(),
              style: TextStyle(
                color: Colors.green,
              ),
            ).onTap(() => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    Text(sections.first.navigationActionLink.defaultEmpty()))))
          ],
        ).paddingOnly(left: 10, right: 10),
        GridView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: sections.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var widthEachItem = MediaQuery.of(context).size.width / 3 - 28;
              return Container(
                width: double.infinity,
                child: Column(
                  children: [
                    CachedNetworkImage(
                      width: widthEachItem,
                      height: widthEachItem * 1.34,
                      imageUrl: "http://webtoon.tinyflutterteam.com/static/" +
                          sections[index].items[0].thumb.defaultEmpty(),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    Expanded(
                      child: Text(
                        sections.first.items[index].name.defaultEmpty(),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ).paddingOnly(left: 10, top: 5),
                    ),
                  ],
                ).onTap(() => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(sections.first.items[index].deeplink
                            .defaultEmpty())))),
              ).paddingOnly(top: 5, left: 5, right: 5);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 5,
                crossAxisSpacing: 2)),
      ],
    );
  }
}
