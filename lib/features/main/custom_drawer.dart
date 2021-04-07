import 'package:flutter/material.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter_webtoon/common/components/language_field.dart';
import 'package:flutter_webtoon/features/main/drawer_item.dart';
import 'package:flutter_webtoon/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class DrawerLayout extends StatelessWidget {
  const DrawerLayout({
    Key? key,
    required this.drawerWidth,
  }) : super(key: key);

  final double drawerWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: drawerWidth,
      color: Colors.green,
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/images/header_drawer.png'),
                  width: 108,
                  height: 150,
                ).paddingAll(5),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      children: [
                        Text(
                          LocaleKeys.login_now.tr(),
                          style: TextStyle(
                              color: Colors.amberAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          LocaleKeys.login_tooltip.tr(),
                          softWrap: true,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    LanguageField(),
                  ],
                ).toCenter(),
              ],
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              width: drawerWidth,
              color: Colors.white,
              child: Column(
                children: [
                  DrawerItem(
                    icon: Icons.list_alt_outlined,
                    title: LocaleKeys.list_comic.tr(),
                    color: Colors.green,
                  ),
                  DrawerItem(
                    icon: Icons.image_aspect_ratio,
                    title: LocaleKeys.list_novel.tr(),
                    color: Colors.green,
                  ),
                  DrawerItem(
                    icon: Icons.group,
                    title: LocaleKeys.my_club.tr(),
                    color: Colors.green,
                    showAction: false,
                  ),
                  DrawerItem(
                    icon: Icons.question_answer_outlined,
                    title: LocaleKeys.common_question.tr(),
                    color: Colors.green,
                    showAction: false,
                  ),
                  DrawerItem(
                    icon: Icons.rate_review,
                    title: LocaleKeys.rate_this_app.tr(),
                    color: Colors.green,
                    showAction: false,
                  ),
                  DrawerItem(
                    icon: Icons.badge,
                    title: LocaleKeys.legacy.tr(),
                    color: Colors.green,
                    showAction: false,
                  ),
                  DrawerItem(
                    icon: Icons.feedback,
                    title: LocaleKeys.feed_back.tr(),
                    color: Colors.green,
                    showAction: false,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
