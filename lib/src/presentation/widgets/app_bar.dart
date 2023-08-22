import 'package:flutter/material.dart';
import 'package:user_app/core/constant/color_const.dart';
import 'package:user_app/core/constant/text_const.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const MyAppBar({
    super.key,
    this.title = '',
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: kTextTheme.titleMedium?.copyWith(
          color: Palette.main,
        ),
      ),
      actions: actions,
      backgroundColor: Palette.skin,
    );
  }
}
