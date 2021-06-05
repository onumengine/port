import 'package:equatable/equatable.dart';

abstract class UsersScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UsersFetchEvent extends UsersScreenEvent {
  String usersOrganizationId;

  UsersFetchEvent({this.usersOrganizationId});

  @override
  List<Object> get props => [this.usersOrganizationId];
}

class UserSubmitEvent extends UsersScreenEvent {
  int selectedUserId;

  UserSubmitEvent({this.selectedUserId});

  List<Object> get props => [this.selectedUserId];
}
