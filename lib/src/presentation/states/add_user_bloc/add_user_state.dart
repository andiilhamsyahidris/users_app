part of 'add_user_bloc.dart';

sealed class AddUserState extends Equatable {
  const AddUserState();

  @override
  List<Object> get props => [];
}

class AddUserEmpty extends AddUserState {}

class InsertUserSuccess extends AddUserState {
  final String successMessage;

  const InsertUserSuccess(this.successMessage);

  @override
  List<Object> get props => [successMessage];
}

class InsertUserFailed extends AddUserState {
  final String failureMessage;

  const InsertUserFailed(this.failureMessage);

  @override
  List<Object> get props => [failureMessage];
}
