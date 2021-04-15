import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webtoon/common/extension/extension.dart';
import 'package:flutter_webtoon/domain/entity/section_entity.dart';
import 'package:dart_extensions/dart_extensions.dart';

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
            ).onTap(() =>
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(
                        sections.first.navigationActionLink.defaultEmpty()))
                )
            )
          ],
        ).paddingOnly(left: 10, right: 10),

        ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: sections.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 134,
                color: Colors.white,
                child: Row(
                  children: [
                    CachedNetworkImage(
                      width: 100,
                      height: 134,
                      imageUrl: "http://webtoon.tinyflutterteam.com/static/" +
                          sections[index].items[0].thumb.defaultEmpty(),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.white, BlendMode.colorBurn)),
                        ),
                      ),
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    Expanded(
                      child: Text(
                        sections.first.items[index].name.defaultEmpty(),
                      ),
                    ),
                  ],
                ).onTap(() =>
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(
                            sections.first.items[index].deeplink.defaultEmpty()))
                    )
                ),
              ).paddingOnly(top: 5, left: 5, right: 5);
            }),
      ],
    );
  }
}
