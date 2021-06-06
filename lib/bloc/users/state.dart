import 'package:equatable/equatable.dart';

abstract class UsersScreenState extends Equatable {
  @override
  List<Object> get props => [];
}

class UpopulatedUsersState extends UsersScreenState {
}

class FetchingUsersState extends UsersScreenState {
  @override
  List<Object> get props => [];
}

class PopulatedUsersState extends UsersScreenState {
  List<dynamic> users;
  String userOrganizationName;

  PopulatedUsersState({
    this.users,
    this.userOrganizationName,
  });

  @override
  List<Object> get props => [
        this.users,
        this.userOrganizationName,
      ];
}

class FetchingErrorState extends UsersScreenState {
  String errorMessage;

  FetchingErrorState({this.errorMessage});

  @override
  List<Object> get props => [this.errorMessage];
}

class SubmittedState extends UsersScreenState {
  List<dynamic> users;
  String userOrganizationName;

  SubmittedState({
    this.users,
    this.userOrganizationName,
  });

  @override
  List<Object> get props => [
    this.users,
    this.userOrganizationName,
  ];
}
