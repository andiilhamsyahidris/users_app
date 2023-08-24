import 'package:dartz/dartz.dart';
import 'package:user_app/core/utils/failure.dart';
import 'package:user_app/src/domain/entities/users_entity.dart';

abstract class UsersRepository {
  Future<Either<Failure, List<UsersEntity>>> getAllUsers();
  Future<Either<Failure, String>> addUsers(
    String? name,
    String? address,
    String? email,
    String? phoneNumber,
    String? city,
  );
}
