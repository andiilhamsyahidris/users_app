import 'dart:async';

import 'package:flutter/material.dart';
import 'package:user_app/core/constant/color_const.dart';
import 'package:user_app/core/constant/text_const.dart';
import 'package:user_app/src/presentation/features/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    // Will change page after two second
    super.didChangeDependencies();
    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        showHomepage(context: context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  'Users',
                  style: kTextTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Palette.main,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  'App',
                  style: kTextTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Palette.main,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
