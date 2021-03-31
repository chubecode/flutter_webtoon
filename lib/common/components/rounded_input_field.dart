import 'package:flutter/material.dart';
import 'package:dart_extensions/dart_extensions.dart';
import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedInputField(
      {Key? key,
        this.hintText = "",
        this.icon = Icons.person,
        required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: hintText,
            icon: Icon(
              icon,
              color: Colors.blue,
            ).paddingOnly(left: 10),
            border: InputBorder.none),
      ),
    );
  }
}