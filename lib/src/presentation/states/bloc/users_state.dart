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
