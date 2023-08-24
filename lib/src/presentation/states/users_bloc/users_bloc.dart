import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_app/src/domain/entities/users_entity.dart';
import 'package:user_app/src/domain/usecases/get_all_users.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetAllUsers getAllUsers;

  UsersBloc({required this.getAllUsers}) : super(UsersEmpty()) {
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
  }
}
