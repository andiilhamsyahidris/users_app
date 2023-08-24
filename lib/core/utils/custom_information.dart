import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_app/core/constant/color_const.dart';
import 'package:user_app/core/constant/text_const.dart';

class CustomInformation extends StatelessWidget {
  final String asset;
  final String title;
  final String subtitle;

  const CustomInformation({
    super.key,
    required this.asset,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            asset,
            width: 200,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: kTextTheme.headlineSmall?.copyWith(color: Palette.main),
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: kTextTheme.bodyLarge?.copyWith(color: Palette.main),
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
