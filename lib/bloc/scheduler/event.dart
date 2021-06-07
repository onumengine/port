import 'package:equatable/equatable.dart';

abstract class SchedulerEvent extends Equatable {}

class TimeSelectionEvent extends SchedulerEvent {
  int selectedButtonIndex;

  TimeSelectionEvent({this.selectedButtonIndex});

  @override
  List<Object> get props => [this.selectedButtonIndex];
}

class DurationSelectionEvent extends SchedulerEvent {
  @override
  List<Object> get props => [];
}

class ScheduleSubmissionEvent extends SchedulerEvent {
  @override
  List<Object> get props => [];
}
