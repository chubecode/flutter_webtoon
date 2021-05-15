import 'package:flutter/material.dart';

import 'text_field_container.dart';
import 'package:dart_extensions/dart_extensions.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final Color hintTextColor;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedInputField(
      {Key? key,
      this.borderColor = Colors.white,
      this.backgroundColor = Colors.white,
      this.textColor = Colors.white,
      this.hintTextColor = Colors.white,
      this.hintText = "",
      this.icon = Icons.person,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      borderRadius: 29,
      child: TextField(
        onChanged: onChanged,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
        ),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: hintTextColor),
            suffixIcon: Icon(
              icon,
              color: Colors.yellow,
            ),
            border: InputBorder.none),
      ),
    ).toCenter();
  }
}
