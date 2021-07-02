import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class MoreState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserFetchedState extends MoreState {
  String userName;

  UserFetchedState({@required this.userName});

  @override
  List<Object> get props => [this.userName];
}

class UserFetchingErrorState extends MoreState {
  String userName;

  UserFetchingErrorState({@required this.userName});

  @override
  List<Object> get props => [this.userName];
}