import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:user_app/core/constant/color_const.dart';
import 'package:user_app/core/constant/text_const.dart';

class UserCard extends StatelessWidget {
  final String? image;
  final String title;
  final String subtitle;
  final String? email;
  final String? phoneNumber;
  final String? city;

  const UserCard({
    super.key,
    this.image,
    this.title = '',
    this.subtitle = '',
    this.email,
    this.phoneNumber,
    this.city,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      collapsed: Container(),
      expanded: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Row(
                children: [
                  const Flexible(
                    child: Icon(
                      Icons.email,
                      size: 18,
                      color: Palette.main,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      email ?? '',
                      style: kTextTheme.bodyLarge?.copyWith(
                        color: Palette.main,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 6),
            Flexible(
              child: Row(
                children: [
                  const Flexible(
                    child: Icon(
                      Icons.phone,
                      size: 18,
                      color: Palette.main,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      phoneNumber ?? '',
                      style: kTextTheme.bodyLarge?.copyWith(
                        color: Palette.main,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Flexible(
              child: Row(
                children: [
                  const Flexible(
                    child: Icon(
                      Icons.location_city,
                      size: 18,
                      color: Palette.main,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      city ?? '',
                      style: kTextTheme.bodyLarge?.copyWith(
                        color: Palette.main,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      header: Row(
        children: [
          Flexible(
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(image!),
              radius: 30,
            ),
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    title,
                    style: kTextTheme.titleMedium?.copyWith(
                      color: Palette.main,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    subtitle,
                    style: kTextTheme.bodyLarge?.copyWith(
                      color: Palette.main.withOpacity(0.7),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      theme: const ExpandableThemeData(
        expandIcon: Icons.keyboard_arrow_up,
        collapseIcon: Icons.keyboard_arrow_down,
        hasIcon: true,
        iconColor: Palette.main,
      ),
    );
  }
}
