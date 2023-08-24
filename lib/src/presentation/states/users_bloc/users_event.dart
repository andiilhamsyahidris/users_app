part of 'users_bloc.dart';

abstract class UsersEvent {
  const UsersEvent();
}

class FetchUsers extends UsersEvent {}
