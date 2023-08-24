import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:user_app/core/utils/exception.dart';
import 'package:user_app/core/utils/failure.dart';
import 'package:user_app/src/data/datasources/users_datasource.dart';
import 'package:user_app/src/domain/entities/users_entity.dart';
import 'package:user_app/src/domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final UsersDatasource usersDatasource;

  UsersRepositoryImpl({required this.usersDatasource});

  @override
  Future<Either<Failure, List<UsersEntity>>> getAllUsers() async {
    try {
      final result = await usersDatasource.getAllUsers();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> addUsers(
    String? name,
    String? address,
    String? email,
    String? phoneNumber,
    String? city,
  ) async {
    try {
      final result = await usersDatasource.addUsers(
        name,
        address,
        email,
        phoneNumber,
        city,
      );
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
