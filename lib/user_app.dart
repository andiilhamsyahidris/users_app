import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:user_app/core/constant/color_const.dart';
import 'package:user_app/src/presentation/features/initial/splash_screen.dart';
import 'package:user_app/src/presentation/states/add_user_bloc/add_user_bloc.dart';

import 'injection.dart' as di;
import 'src/presentation/states/users_bloc/users_bloc.dart';

class UserApp extends StatelessWidget {
  const UserApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<UsersBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<AddUserBloc>(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Users',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Palette.main).copyWith(
            background: Palette.skin,
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
