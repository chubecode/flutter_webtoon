import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter_webtoon/common/extension/extension.dart';
import 'package:flutter_webtoon/domain/entity/title_entity.dart';


class WebtoonAction extends StatelessWidget {
  const WebtoonAction({
    Key? key,
    required this.actionSections,
  }) : super(key: key);

  final List<TitleEntity> actionSections;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: actionSections.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CachedNetworkImage(
                width: 40,
                height: 40,
                imageUrl:
                "http://webtoon.tinyflutterteam.com/static/images/" +
                    actionSections[index].thumb.defaultEmpty(),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.white, BlendMode.colorBurn)),
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Expanded(
                  child: Text(actionSections[index].name.defaultEmpty())),
            ],
          ).toCenter();
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 10,
          );
        },
      ).paddingOnly(top: 10).toCenter(),
    );
  }
}
