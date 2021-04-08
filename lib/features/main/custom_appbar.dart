import 'package:flutter/material.dart';
import 'package:flutter_webtoon/common/components/rounded_input_field.dart';
import 'package:flutter_webtoon/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:dart_extensions/dart_extensions.dart';

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
      color: Colors.green ,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: onDrawerTap,
          ),
          Container(
            width: 160,
            child: RoundedInputField(
              onChanged: (String value) {},
              hintText: LocaleKeys.search.tr(),
              icon: Icons.search,
              borderColor: Colors.grey,
            ).toCenter().paddingAll(2),
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_active,
              color: Colors.white,
            ),
            onPressed: () => {},
          ),
          Container(
            width: 80,
            decoration:  BoxDecoration(
              color: Colors.yellow,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(29),
            ),
            child: Text(
              "\u{1F4B0} "+
                  LocaleKeys.receive.tr(),
              style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
            ).paddingAll(5),
          ).paddingAll(10),
        ],
      ),
    );
  }

}
