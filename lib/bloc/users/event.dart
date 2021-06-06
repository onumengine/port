import 'package:equatable/equatable.dart';

abstract class UsersScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UsersFetchEvent extends UsersScreenEvent {
  String usersOrganizationId;
  String usersOrganizationName;

  UsersFetchEvent({
    this.usersOrganizationId,
    this.usersOrganizationName,
  });

  @override
  List<Object> get props => [
        this.usersOrganizationId,
        this.usersOrganizationName,
      ];
}

class UserSubmitEvent extends UsersScreenEvent {
  String selectedUserId;

  UserSubmitEvent({this.selectedUserId});

  List<Object> get props => [this.selectedUserId];
}
