part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersEmpty extends UsersState {}

class UsersLoading extends UsersState {}

class UsersError extends UsersState {
  final String message;

  const UsersError(this.message);

  @override
  List<Object> get props => [message];
}

class UsersHasData extends UsersState {
  final List<UsersEntity> resultUsers;

  const UsersHasData(this.resultUsers);

  @override
  List<Object> get props => [resultUsers];
}

class InsertUserSuccess extends UsersState {
  final String successMessage;

  const InsertUserSuccess(this.successMessage);

  @override
  List<Object> get props => [successMessage];
}

class InsertUserFailed extends UsersState {
  final String failureMessage;

  const InsertUserFailed(this.failureMessage);

  @override
  List<Object> get props => [failureMessage];
}
