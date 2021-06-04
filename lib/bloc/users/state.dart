import 'package:equatable/equatable.dart';

abstract class UsersScreenState extends Equatable {}

class UpopulatedUsersState extends UsersScreenState {
  @override
  List<Object> get props => [];
}

class FetchingUsersState extends UsersScreenState {
  @override
  List<Object> get props => [];
}

class PopulatedUsersState extends UsersScreenState {
  List<dynamic> users;

  PopulatedUsersState({this.users});

  @override
  List<Object> get props => [this.users];
}

class FetchingErrorState extends UsersScreenState {
  String errorMessage;

  FetchingErrorState({this.errorMessage});

  @override
  List<Object> get props => [this.errorMessage];
}
