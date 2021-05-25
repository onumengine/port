import 'package:equatable/equatable.dart';

abstract class SubmitScreenState extends Equatable {}

class DefaultState extends SubmitScreenState {
  @override
  List<Object> get props => [];
}

class SubmittingState extends SubmitScreenState {
  @override
  List<Object> get props => [];
}

class SuccessfulSubmissionState extends SubmitScreenState {
  @override
  List<Object> get props => [];
}

class SubmissionErrorState extends SubmitScreenState {
  @override
  List<Object> get props => [];
}
