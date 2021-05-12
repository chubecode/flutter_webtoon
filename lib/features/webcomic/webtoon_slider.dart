import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webtoon/common/extension/extension.dart';
import 'package:flutter_webtoon/domain/entity/section_item_entity.dart';

class WebtoonSlider extends StatelessWidget {
  const WebtoonSlider({
    Key? key,
    required this.sliderSections,
  }) : super(key: key);

  final List<SectionItemEntity> sliderSections;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: sliderSections.length,
      itemBuilder: (BuildContext context, int itemIndex, int realIndex) =>
          Container(
        child: CachedNetworkImage(
          imageUrl: "http://webtoon.tinyflutterteam.com/static/" +
              sliderSections[itemIndex].thumb.defaultEmpty(),
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.white, BlendMode.colorBurn)),
            ),
          ),
          errorWidget: (context, url, error) =>
              Image(image: AssetImage('assets/images/header_drawer.png')),
        ),
      ),
      options: CarouselOptions(
          aspectRatio: 3 / 4,
          enableInfiniteScroll: true,
          autoPlayCurve: Curves.easeInExpo,
          autoPlay: true,
          height: 180),
    );
  }
}
