import 'package:equatable/equatable.dart';

abstract class UsersScreenEvent extends Equatable {}

class UsersFetchEvent extends UsersScreenEvent {
  @override
  List<Object> get props => [];
}
