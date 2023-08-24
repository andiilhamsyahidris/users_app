import 'package:equatable/equatable.dart';
import 'package:user_app/src/domain/entities/users_entity.dart';

class UsersModel extends Equatable {
  final String? name;
  final String? address;
  final String? email;
  final String? phoneNumber;
  final String? city;

  const UsersModel({
    this.name,
    this.address,
    this.email,
    this.city,
    this.phoneNumber,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        name: json['name'],
        address: json['address'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        city: json['city'],
      );

  factory UsersModel.fromEntity(UsersEntity user) => UsersModel(
        name: user.name,
        address: user.address,
        email: user.email,
        phoneNumber: user.phoneNumber,
        city: user.city,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'email': email,
        'phoneNumber': phoneNumber,
        'city': city,
      };

  UsersEntity toEntity() {
    return UsersEntity(
      name: name,
      address: address,
      email: email,
      phoneNumber: phoneNumber,
      city: city,
    );
  }

  @override
  List<Object?> get props => [
        name,
        address,
        email,
        phoneNumber,
        city,
      ];
}
