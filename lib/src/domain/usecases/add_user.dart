import 'package:dartz/dartz.dart';
import 'package:user_app/core/utils/failure.dart';
import 'package:user_app/src/domain/repositories/users_repository.dart';

class InsertUser {
  final UsersRepository repository;

  InsertUser({required this.repository});

  Future<Either<Failure, String>> execute(
    String? name,
    String? address,
    String? email,
    String? phoneNumber,
    String? city,
  ) {
    return repository.addUsers(
      name,
      address,
      email,
      phoneNumber,
      city,
    );
  }
}
