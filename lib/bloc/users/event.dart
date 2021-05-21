import 'package:equatable/equatable.dart';

abstract class UsersScreenEvent extends Equatable {}

class UsersFetchEvent extends UsersScreenEvent {
  @override
  List<Object> get props => [];
}

class UsersFetchingError extends UsersScreenEvent {
  @override
  List<Object> get props => [];
}

class UsersFetchingComplete extends UsersScreenEvent {
  @override
  List<Object> get props => [];
}
