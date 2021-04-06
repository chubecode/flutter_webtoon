import 'package:flutter/material.dart';
import 'package:dart_extensions/dart_extensions.dart';

class DrawerItem extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final bool showAction;

  const DrawerItem({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    this.showAction = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: color,
        ),
        Text(
          title,
          style: TextStyle(color: color),
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: showAction ? color : Colors.white,
        )
      ],
    ).paddingAll(15);
  }
}
