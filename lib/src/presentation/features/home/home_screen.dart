import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/core/constant/color_const.dart';
import 'package:user_app/src/presentation/widgets/app_bar.dart';

void showHomepage({required BuildContext context}) {
  Get.offAll(const Homescreen());
}

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Users',
        actions: [
          Padding(
            padding: const EdgeInsets.all(6),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.sort_by_alpha,
                color: Palette.main,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.search,
                color: Palette.main,
              ),
            ),
          )
        ],
      ),
    );
  }
}
