import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:user_app/core/constant/color_const.dart';

class LoadingScreen extends StatelessWidget {
  final bool withScaffold;
  const LoadingScreen({super.key, this.withScaffold = false});

  @override
  Widget build(BuildContext context) {
    return withScaffold
        ? Scaffold(
            body: content(),
            backgroundColor: Palette.grey,
          )
        : content();
  }

  Center content() {
    return const Center(
      child: SpinKitCubeGrid(
        color: Palette.grey,
        size: 50.0,
      ),
    );
  }
}
