import 'package:equatable/equatable.dart';

abstract class SubmitScreenState extends Equatable {
  @override
  List<Object> get props => [];
}

class DefaultState extends SubmitScreenState {
  String date, time, duration, selectedPurpose;
  List purposes;

  DefaultState({
    this.date,
    this.time,
    this.duration,
    this.purposes = const [],
    this.selectedPurpose,
  });

  List<Object> get props => [
        this.date,
        this.time,
        this.duration,
        this.purposes,
        this.selectedPurpose,
      ];
}

class SubmittingState extends SubmitScreenState {}

class SuccessfulSubmissionState extends SubmitScreenState {}

class SubmissionErrorState extends SubmitScreenState {}
