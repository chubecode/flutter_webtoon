import 'package:flutter/material.dart';
import 'package:dart_extensions/dart_extensions.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function()? press;
  final Color color, textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = Colors.white,
    this.textColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: size.width * 0.8, height: 50),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(29),
          ),
          primary: Colors.blue,
          textStyle: TextStyle(fontSize: 20),
        ),
        onPressed: press,
        label: Text(text),
        icon: Icon(Icons.login_outlined),
      ),
    ).paddingSymmetric(h: 20, v: 20);
  }
}
