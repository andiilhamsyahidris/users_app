import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:user_app/core/utils/api_service.dart';
import 'package:user_app/core/utils/exception.dart';
import 'package:user_app/src/data/models/users_model.dart';
import 'package:user_app/src/data/models/users_response.dart';

abstract class UsersDatasource {
  Future<List<UsersModel>> getAllUsers();
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
}
