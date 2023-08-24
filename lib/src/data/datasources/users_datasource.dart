import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:user_app/core/utils/api_service.dart';
import 'package:user_app/core/utils/exception.dart';
import 'package:user_app/src/data/models/users_model.dart';
import 'package:user_app/src/data/models/users_response.dart';

abstract class UsersDatasource {
  Future<List<UsersModel>> getAllUsers();
  Future<String> addUsers(UsersModel usersModel);
}

class UsersDatasourceImpl implements UsersDatasource {
  final http.Client client;

  UsersDatasourceImpl({
    required this.client,
  });

  @override
  Future<List<UsersModel>> getAllUsers() async {
    final response = await client.get(Uri.parse('${ApiService.baseurl}user'));

    if (response.statusCode == 200) {
      return UsersResponse.fromJson(json.decode(response.body)).userList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> addUsers(UsersModel usersModel) async {
    final response =
        await client.post(Uri.parse('${ApiService.baseurl}user'), body: {
      'name': usersModel.name,
      'address': usersModel.address,
      'email': usersModel.email,
      'phoneNumber': usersModel.phoneNumber,
      'city': usersModel.city,
    });
    if (response.statusCode == 200) {
      return 'Added Users';
    } else {
      throw ServerException();
    }
  }
}
