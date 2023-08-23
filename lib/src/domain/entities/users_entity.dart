import 'package:equatable/equatable.dart';

class UsersEntity extends Equatable {
  final String? name;
  final String? address;
  final String? email;
  final String? phoneNumber;
  final String? city;

  const UsersEntity({
    this.name,
    this.address,
    this.email,
    this.city,
    this.phoneNumber,
  });

  @override
  List<Object?> get props => [
        name,
        address,
        email,
        phoneNumber,
        city,
      ];
}
