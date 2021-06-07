import 'package:equatable/equatable.dart';

abstract class SchedulerScreenState extends Equatable {}

class ScheduleState extends SchedulerScreenState {
  int selectedTimeButtonIndex, selectedDurationButtonIndex;
  Map<int, String> availableTimes, availableDurations;

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
