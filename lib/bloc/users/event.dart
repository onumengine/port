import 'package:equatable/equatable.dart';

abstract class UsersScreenEvent extends Equatable {}

class UsersFetchEvent extends UsersScreenEvent {
  String usersOrganizationId;

  UsersFetchEvent({this.usersOrganizationId});

  @override
  List<Object> get props => [this.usersOrganizationId];
}
