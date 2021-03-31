import 'package:flutter/material.dart';
import 'package:dart_extensions/dart_extensions.dart';

import 'text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final bool isObscureText;
  final ValueChanged<bool> onChangedObscureText;
  const RoundedPasswordField(
      {Key? key,
      required this.onChanged,
      required this.hintText,
      required this.isObscureText,
      required this.onChangedObscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextFieldContainer(
        child: TextField(
      obscureText: isObscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          icon: Icon(
            Icons.lock,
            color: Colors.blue,
          ).paddingOnly(left: 10),
          suffixIcon: Icon(Icons.visibility, color: Colors.blue)
              .onTap(() => onChangedObscureText(isObscureText)),
          border: InputBorder.none),
    ));
  }
}
