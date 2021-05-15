import 'package:flutter/material.dart';
import 'package:dart_extensions/dart_extensions.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  final double borderRadius;
  final Color backgroundColor;

  const TextFieldContainer(
      {Key? key,
      required this.child,
      this.borderColor = Colors.white,
      this.borderRadius = 0,
      this.backgroundColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      height: double.maxFinite,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    ).toCenter();
  }
}
