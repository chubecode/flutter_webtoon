
import 'package:flutter/material.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageField extends StatelessWidget {
  const LanguageField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 110,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(29)),
      child: DropdownButton(
        underline: Container(),
        isExpanded: true,
        icon: Icon(Icons.language).paddingAll(5),
        items: [
          DropdownMenuItem(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(image: AssetImage('assets/images/ic_vi.png')),
                Text('VI'),
              ],
            ),
            value: Locale('vi'),
          ),
          DropdownMenuItem(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(image: AssetImage('assets/images/ic_en.png')),
                Text('EN'),
              ],
            ),
            value: Locale('en'),
          ),
        ],
        onChanged: (v) => context.setLocale(v as Locale),
        value: Locale(context.locale.languageCode),
      ).paddingOnly(left: 10, right: 10),
    ).toCenter();
  }
}