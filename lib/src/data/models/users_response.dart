import 'package:equatable/equatable.dart';
import 'package:user_app/src/data/models/users_model.dart';

class UsersResponse extends Equatable {
  final List<UsersModel> userList;

  const UsersResponse({required this.userList});

  factory UsersResponse.fromJson(List<dynamic> json) => UsersResponse(
          userList: List<UsersModel>.from(
        (json).map((e) => UsersModel.fromJson(e)),
      ));
  List<dynamic> toJson() => List<dynamic>.from(userList.map((e) => e.toJson()));

  @override
  List<Object> get props => [userList];
}
