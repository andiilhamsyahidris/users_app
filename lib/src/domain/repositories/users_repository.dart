import 'package:dartz/dartz.dart';
import 'package:user_app/core/utils/failure.dart';
import 'package:user_app/src/domain/entities/users_entity.dart';

abstract class UsersRepository {
  Future<Either<Failure, List<UsersEntity>>> getAllUsers();
}
