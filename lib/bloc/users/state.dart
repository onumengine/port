import 'package:equatable/equatable.dart';

abstract class UsersScreenState extends Equatable {}

class UnfetchedUsersState extends UsersScreenState {
  @override
  List<Object> get props => [];
}

class FetchingUsersState extends UsersScreenState {
  @override
  List<Object> get props => [];
}

class PopulatedUsersState extends UsersScreenState {
  @override
  List<Object> get props => [];
}

class FetchingErrorState extends UsersScreenState {
  @override
  List<Object> get props => [];
}
