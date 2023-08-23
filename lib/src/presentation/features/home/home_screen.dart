import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:user_app/core/constant/color_const.dart';
import 'package:user_app/core/constant/text_const.dart';
import 'package:user_app/src/presentation/states/bloc/users_bloc.dart';
import 'package:user_app/src/presentation/widgets/app_bar.dart';
import 'package:user_app/src/presentation/widgets/user_card.dart';

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
  void initState() {
    super.initState();
    Future.microtask(() => context.read<UsersBloc>().add(FetchUsers()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Users App',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    'Users',
                    style: kTextTheme.bodyLarge?.copyWith(
                      color: Palette.main,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                BlocBuilder<UsersBloc, UsersState>(
                  builder: (context, state) {
                    if (state is UsersLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is UsersHasData) {
                      final result = state.resultUsers;
                      return ListView.separated(
                        shrinkWrap: true,
                        controller: ScrollController(keepScrollOffset: false),
                        itemBuilder: (context, index) {
                          final user = result[index];
                          return UserCard(
                            image:
                                'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80',
                            title: user.name ?? 'Unknown',
                            subtitle: user.city ?? 'Unknown',
                            email: user.email ?? 'Unknown',
                            phoneNumber: user.phoneNumber ?? 'Unknown',
                            city: user.city ?? 'Unknown',
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemCount: result.length,
                      );
                    } else if (state is UsersError) {
                      return const Center(
                        child: Text('Terjadi Kesalahan'),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
