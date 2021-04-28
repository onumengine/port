
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


abstract class CreateStudentState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends CreateStudentState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CreateStudentState {

  @override
  List<Object> get props => [];
}

class EmptyState extends CreateStudentState {

  @override
  List<Object> get props => [];
}


class PostingState extends CreateStudentState {

  @override
  List<Object> get props => [];
}

class PostingError extends CreateStudentState {
  final String error;

  PostingError({@required this.error});

  @override
  List<Object> get props => [error];
}


class RefreshingState extends CreateStudentState {
  @override
  List<Object> get props => [];
}

class LoadedState extends CreateStudentState {
  //final List<LoanSchedule> data;
 // LoadedState({@required this.data});
  @override
  List<Object> get props => [];
}

class LoadFailureState extends CreateStudentState {
  final String error;

  LoadFailureState({@required this.error});

  @override
  List<Object> get props => [error];
}

class PostedSuccess extends CreateStudentState {
String message;
PostedSuccess({@required this.message});
  @override
  List<Object> get props => [];
}
