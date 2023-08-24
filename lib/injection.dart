import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:user_app/src/data/datasources/users_datasource.dart';
import 'package:user_app/src/data/repositories/users_repository_impl.dart';
import 'package:user_app/src/domain/repositories/users_repository.dart';
import 'package:user_app/src/domain/usecases/add_user.dart';
import 'package:user_app/src/domain/usecases/get_all_users.dart';
import 'package:user_app/src/presentation/states/bloc/users_bloc.dart';

final locator = GetIt.instance;

void init() {
  // Datasources
  locator.registerLazySingleton<UsersDatasource>(
    () => UsersDatasourceImpl(
      client: locator(),
    ),
  );

  // Repository
  locator.registerLazySingleton<UsersRepository>(
    () => UsersRepositoryImpl(usersDatasource: locator()),
  );

  // Use cases
  locator.registerLazySingleton(() => GetAllUsers(repositories: locator()));
  locator.registerLazySingleton(() => InsertUser(repository: locator()));

  // BloC
  locator.registerFactory(
      () => UsersBloc(getAllUsers: locator(), addUser: locator()));

  // External
  locator.registerLazySingleton(() => http.Client());
}
