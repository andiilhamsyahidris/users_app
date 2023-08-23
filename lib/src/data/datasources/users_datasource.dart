import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:user_app/core/utils/api_service.dart';
import 'package:user_app/core/utils/exception.dart';
import 'package:user_app/src/data/datasources/users_database.dart';
import 'package:user_app/src/data/models/users_model.dart';
import 'package:user_app/src/data/models/users_response.dart';

abstract class UsersDatasource {
  Future<List<UsersModel>> getAllUsers();
}

class UsersDatasourceImpl implements UsersDatasource {
  final http.Client client;
  final UsersDatabase usersDb;

  UsersDatasourceImpl({
    required this.client,
    required this.usersDb,
  });

  @override
  Future<List<UsersModel>> getAllUsers() async {
    final response = await client.get(Uri.parse('${ApiService.baseurl}user'));

    if (response.statusCode == 200) {
      final users = UsersResponse.fromJson(json.decode(response.body)).userList;
      final nameUsers = UsersModel.fromJson(json.decode(response.body));
      usersDb.setUserId(nameUsers.name ?? '');
      return users;
    } else {
      throw ServerException();
    }
  }
}
