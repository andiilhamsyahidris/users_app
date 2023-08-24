part of 'users_bloc.dart';

abstract class UsersEvent {
  const UsersEvent();
}

class FetchUsers extends UsersEvent {}

class AddUser extends UsersEvent {
  final UsersEntity usersEntity;

  const AddUser(this.usersEntity);
}
