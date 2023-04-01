import 'package:flutter/material.dart';

class AppBarProject extends StatelessWidget implements PreferredSizeWidget {
  AppBarProject({
    Key? key,
    this.actions,
    MaterialColor? backgroundColor,
    required this.title,
    required this.elevation,
  }) : super(key: key) {
    color = backgroundColor ?? Colors.blue;
  }

  final Text title;
  final double? elevation;
  late MaterialColor color;
  late List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: title,
        elevation: elevation,
        backgroundColor: color,
        actions: actions);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
