import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


abstract class SignInState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInInitialState extends SignInState {
  @override
  List<Object> get props => [];
}


class SignInPostingState extends SignInState {

  @override
  List<Object> get props => [];
}

class SignInPostingError extends SignInState {
  final String error;

  SignInPostingError({@required this.error});

  @override
  List<Object> get props => [error];
}


class SignInPostedSuccess extends SignInState {
  String message;
  SignInPostedSuccess({@required this.message});
  @override
  List<Object> get props => [];
}
