import 'package:dartz/dartz.dart';
import 'package:user_app/core/utils/failure.dart';
import 'package:user_app/src/domain/entities/users_entity.dart';
import 'package:user_app/src/domain/repositories/users_repository.dart';

class GetAllUsers {
  final UsersRepository repositories;

  GetAllUsers({required this.repositories});

  Future<Either<Failure, List<UsersEntity>>> execute() {
    return repositories.getAllUsers();
  }
}
