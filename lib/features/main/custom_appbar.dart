import 'package:flutter/material.dart';
import 'package:flutter_webtoon/common/components/rounded_input_field.dart';
import 'package:flutter_webtoon/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dart_extensions/dart_extensions.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: AppBar(
            backgroundColor: Colors.white,
            title: Container(
              width: double.infinity,
              height: 86,
              child: RoundedInputField(
                onChanged: (String value) {},
                hintText: LocaleKeys.search.tr(),
                icon: Icons.search,
                borderColor: Colors.grey,
              ).paddingOnly(top: 10,bottom: 10),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.notifications_active,
                  color: Colors.green,
                ),
                onPressed: () => {},
              ),
              IconButton(
                icon: Icon(
                  Icons.monetization_on_sharp,
                  color: Colors.amber,
                ),
                onPressed: () => {},
              ),
            ],
          ),
        ),
      ],
    ).paddingOnly(top: 10, bottom: 10);
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
