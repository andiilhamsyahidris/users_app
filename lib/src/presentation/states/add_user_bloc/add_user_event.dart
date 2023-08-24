part of 'add_user_bloc.dart';

abstract class AddUserEvent {
  const AddUserEvent();
}

class AddUser extends AddUserEvent {
  final String? name;
  final String? address;
  final String? email;
  final String? phoneNumber;
  final String? city;

  const AddUser(
    this.address,
    this.name,
    this.email,
    this.phoneNumber,
    this.city,
  );
}
