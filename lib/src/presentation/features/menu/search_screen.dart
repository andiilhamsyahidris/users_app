import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:user_app/core/constant/asset_path.dart';
import 'package:user_app/core/constant/color_const.dart';
import 'package:user_app/core/utils/custom_information.dart';
import 'package:user_app/src/domain/entities/users_entity.dart';
import 'package:user_app/src/presentation/states/users_bloc/users_bloc.dart';
import 'package:user_app/src/presentation/widgets/app_bar.dart';
import 'package:user_app/src/presentation/widgets/user_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController editingController = TextEditingController();
  List<UsersEntity> allData = [];
  List<UsersEntity> foundData = [];

  @override
  void initState() {
    super.initState();
    foundData = allData;
    Future.microtask(() => context.read<UsersBloc>().add(FetchUsers()));
  }

  @override
  void dispose() {
    editingController.dispose();
    foundData.clear();
    super.dispose();
  }

  void filterSearchResults(String query) {
    List<UsersEntity> result = [];
    if (query.trim().isEmpty) {
      result = foundData;
    } else {
      result = allData
          .where(
            (element) => element.name!.toLowerCase().contains(
                  query.trim().toLowerCase(),
                ),
          )
          .toList();
    }
    foundData = result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Cari Pengguna',
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: Palette.main,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      filterSearchResults(value);
                    });
                  },
                  controller: editingController,
                  decoration: const InputDecoration(
                    labelText: 'Cari User',
                    hintText: 'Masukkan Nama Pengguna',
                    prefixIcon: Icon(Icons.search),
                    focusColor: Palette.second,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                BlocBuilder<UsersBloc, UsersState>(
                  builder: (context, state) {
                    if (state is UsersLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is UsersHasData) {
                      final result = state.resultUsers;
                      filterSearchResults(editingController.text);
                      allData = result;

                      if (foundData.isEmpty) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 5,
                          ),
                          child: CustomInformation(
                            asset: AssetPath.getVectors('empty.svg'),
                            title: 'Data tidak Ditemukan',
                            subtitle: 'Data is Empty',
                          ),
                        );
                      }

                      return ListView.separated(
                        shrinkWrap: true,
                        controller: ScrollController(keepScrollOffset: false),
                        itemBuilder: (context, index) {
                          return UserCard(
                            image:
                                'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80',
                            title: foundData[index].name ?? '',
                            subtitle: foundData[index].address ?? '',
                            email: foundData[index].email ?? '',
                            phoneNumber: foundData[index].phoneNumber ?? '',
                            city: foundData[index].city ?? '',
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 8),
                        itemCount: foundData.length,
                      );
                    } else if (state is UsersError) {
                      return const Center(
                        child: Text('Terjadi Masalah'),
                      );
                    } else {
                      return CustomInformation(
                        asset: AssetPath.getVectors('empty.svg'),
                        title: 'Data tidak Ditemukan',
                        subtitle: 'Data is Empty',
                      );
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
