import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_app/src/domain/entities/users_entity.dart';
import 'package:user_app/src/domain/usecases/add_user.dart';
import 'package:user_app/src/domain/usecases/get_all_users.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetAllUsers getAllUsers;
  final InsertUser addUser;

  UsersBloc({required this.getAllUsers, required this.addUser})
      : super(UsersEmpty()) {
    on<FetchUsers>(
      (event, emit) async {
        emit(UsersLoading());

        final result = await getAllUsers.execute();
        result.fold(
          (failure) {
            emit(UsersError(failure.message));
          },
          (data) {
            emit(
              UsersHasData(data),
            );
          },
        );
      },
    );
    on<AddUser>((event, emit) async {
      emit(UsersLoading());

      final user = event.usersEntity;

      final result = await addUser.execute(user);
      result.fold((failure) {
        emit(InsertUserFailed(failure.message));
      }, (data) {
        emit(InsertUserSuccess(data));
      });
    });
  }
}
