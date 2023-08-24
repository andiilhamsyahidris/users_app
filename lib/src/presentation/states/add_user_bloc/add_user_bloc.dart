import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_app/src/domain/usecases/add_user.dart';

part 'add_user_event.dart';
part 'add_user_state.dart';

class AddUserBloc extends Bloc<AddUserEvent, AddUserState> {
  final InsertUser addUser;

  AddUserBloc({required this.addUser}) : super((AddUserEmpty())) {
    on<AddUser>((event, emit) async {
      final name = event.name;
      final address = event.address;
      final email = event.email;
      final phoneNumber = event.phoneNumber;
      final city = event.city;

      final result =
          await addUser.execute(name, address, email, phoneNumber, city);
      result.fold((failure) {
        emit(InsertUserFailed(failure.message));
      }, (data) {
        emit(InsertUserSuccess(data));
      });
    });
  }
}
