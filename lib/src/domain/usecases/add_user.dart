import 'package:dartz/dartz.dart';
import 'package:user_app/core/utils/failure.dart';
import 'package:user_app/src/domain/entities/users_entity.dart';
import 'package:user_app/src/domain/repositories/users_repository.dart';

class InsertUser {
  final UsersRepository repository;

  InsertUser({required this.repository});

  Future<Either<Failure, String>> execute(UsersEntity users) {
    return repository.addUsers(users);
  }
}
