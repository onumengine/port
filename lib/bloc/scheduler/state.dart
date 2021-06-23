import 'package:equatable/equatable.dart';

abstract class SchedulerScreenState extends Equatable {}

class ScheduleState extends SchedulerScreenState {
  final int selectedTimeButtonIndex, selectedDurationButtonIndex;
  final Map<int, String> availableTimes, availableDurations;

  ScheduleState({
    this.selectedTimeButtonIndex,
    this.selectedDurationButtonIndex,
    this.availableTimes,
    this.availableDurations,
  });

  @override
  List<Object> get props => [
        this.selectedTimeButtonIndex,
        this.selectedDurationButtonIndex,
        this.availableTimes,
        this.availableDurations,
      ];
}

class ScheduleClearForSubmissionState extends ScheduleState {
  final int selectedTimeButtonIndex, selectedDurationButtonIndex;
  final Map<int, String> availableTimes, availableDurations;
  final bool proceedToSubmission;

  ScheduleClearForSubmissionState({
    this.selectedTimeButtonIndex,
    this.selectedDurationButtonIndex,
    this.availableTimes,
    this.availableDurations,
    this.proceedToSubmission = false,
  });

  @override
  List<Object> get props => [
        this.selectedTimeButtonIndex,
        this.selectedDurationButtonIndex,
        this.availableTimes,
        this.availableDurations,
        this.proceedToSubmission,
      ];
}
