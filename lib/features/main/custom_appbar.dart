import 'package:dart_extensions/dart_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webtoon/common/components/text_field_container.dart';
import 'package:flutter_webtoon/generated/locale_keys.g.dart';

class MyCustomAppBar extends StatelessWidget {
  final double height;
  final Function()? onDrawerTap;

  const MyCustomAppBar({
    Key? key,
    required this.height,
    required this.onDrawerTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(29),
              color: Colors.black12,
            ),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 16,
              ),
              onPressed: onDrawerTap,
            ),
          ),
          Container(
            width: 200,
            child: TextFieldContainer(
              borderRadius: 29,
              borderColor: Colors.black12,
              backgroundColor: Colors.white54,
              child: Row(
                children: [
                  Text(
                    LocaleKeys.search.tr(),
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.start,
                  ).alignAtCenterLeft().paddingOnly(left: 16),
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                  ).alignAtCenterRight().paddingOnly(left: 70)
                ],
              ),
            ),
          ).onTap(() => {
                //todo goto search screen
              }),
          Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(29),
              color: Colors.greenAccent,
            ),
            child: IconButton(
              iconSize: 16,
              icon: Icon(
                Icons.notifications_active,
                color: Colors.white,
              ),
              onPressed: () => {},
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.yellow, Colors.white],
                ),
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(29),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.monetization_on_rounded,
                    color: Colors.white,
                  ),
                  Text(
                    LocaleKeys.receive.tr(),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ).paddingAll(5),
                ],
              ),
            ).paddingAll(5),
          ),
        ],
      ),
    );
  }
}
