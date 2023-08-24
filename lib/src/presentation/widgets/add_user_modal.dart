import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:user_app/core/constant/color_const.dart';
import 'package:user_app/core/constant/text_const.dart';
import 'package:user_app/src/presentation/states/add_user_bloc/add_user_bloc.dart';
import 'package:user_app/src/presentation/widgets/blur_background_container.dart';

class AddUserModal extends StatelessWidget {
  const AddUserModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlurBackgroundContainer(
      modal: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 24,
          ),
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
          decoration: const BoxDecoration(
            color: Palette.main,
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    Text(
                      'Tambah Pengguna',
                      style: kTextTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w600, color: Palette.skin),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Tambahkan pengguna dengan mengisi form di bawah ini',
                        textAlign: TextAlign.center,
                        style: kTextTheme.bodySmall?.copyWith(
                          color: Palette.skin,
                        ),
                      ),
                    ),
                    const _AddUserForm(),
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -48,
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: const CircleAvatar(
                      radius: 16,
                      backgroundColor: Palette.skin,
                      child: Icon(
                        Icons.close,
                        color: Palette.main,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AddUserForm extends StatefulWidget {
  const _AddUserForm();

  @override
  State<_AddUserForm> createState() => _AddUserFormState();
}

class _AddUserFormState extends State<_AddUserForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  bool isLoadingStart = false;

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Nama",
                style: TextStyle(
                  color: Palette.skin,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  controller: _nameController,
                  style: const TextStyle(color: Palette.skin),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Harap isi nama terlebih dahulu';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.skin),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Palette.skin,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    errorStyle: const TextStyle(height: 0.5),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Palette.skin,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.person_rounded,
                              size: 18,
                              color: Palette.main,
                            ),
                          )),
                    ),
                  ),
                ),
              ),
              const Text(
                "Alamat",
                style: TextStyle(
                  color: Palette.skin,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  controller: _addressController,
                  style: const TextStyle(color: Palette.skin),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Harap isi alamat terlebih dahulu";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.skin),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Palette.skin,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    errorStyle: const TextStyle(height: 0.5),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Palette.skin,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.location_on,
                            size: 18,
                            color: Palette.main,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                "Email",
                style: TextStyle(
                  color: Palette.skin,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  controller: _emailController,
                  style: const TextStyle(color: Palette.skin),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Harap isi alamat email terlebih dahulu";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.skin),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Palette.skin,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    errorStyle: const TextStyle(height: 0.5),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Palette.skin,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.email,
                            size: 18,
                            color: Palette.main,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                "No. HP",
                style: TextStyle(
                  color: Palette.skin,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  controller: _phoneNumberController,
                  style: const TextStyle(color: Palette.skin),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Harap isi nomor hp terlebih dahulu";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.skin),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Palette.skin,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    errorStyle: const TextStyle(height: 0.5),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Palette.skin,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.phone,
                            size: 18,
                            color: Palette.main,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Text(
                "Kota",
                style: TextStyle(
                  color: Palette.skin,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  controller: _cityController,
                  style: const TextStyle(color: Palette.skin),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Harap isi kota terlebih dahulu";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Palette.skin),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Palette.skin,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    errorStyle: const TextStyle(height: 0.5),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Palette.skin,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.location_city,
                            size: 18,
                            color: Palette.main,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  addingUser(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Palette.skin,
                  minimumSize: const Size(double.infinity, 56),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Palette.main,
                  size: 18,
                ),
                label: const Text(
                  'Tambah',
                  style: TextStyle(color: Palette.main),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void addingUser(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      context.read<AddUserBloc>().add(
            AddUser(
                _addressController.text,
                _nameController.text,
                _emailController.text,
                _phoneNumberController.text,
                _cityController.text),
          );

      Future.delayed(const Duration(seconds: 1), () {
        Get.back();
      });
    }
  }
}
