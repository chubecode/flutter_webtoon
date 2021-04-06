import 'package:dart_extensions/dart_extensions.dart';
import 'package:flutter/material.dart';

import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final Color borderColor;
  final Color backgroundColor;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedInputField(
      {Key? key,
        this.borderColor = Colors.white,
        this.backgroundColor = Colors.white,
        this.hintText = "",
        this.icon = Icons.person,
        required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      child: TextField(
        onChanged: onChanged,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            hintText: hintText,
            icon: Icon(
              icon,
              color: Colors.grey,
            ).paddingOnly(left: 10),
            border: InputBorder.none),
      ),
    );
  }
}