import 'package:equatable/equatable.dart';

abstract class MoreEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UserFetchEvent extends MoreEvent {}