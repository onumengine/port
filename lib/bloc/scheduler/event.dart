import 'package:equatable/equatable.dart';

abstract class SchedulerEvent extends Equatable {}

/// When I increment a variable, the new value will be passed to the state constructor
/// with [mapEventToState()]. The same goes for decrementing the variable.
class MonthIncrementEvent extends SchedulerEvent {
  @override
  List<Object> get props => [];
}

class MonthDecrementEvent extends SchedulerEvent {
  @override
  List<Object> get props => [];
}

class YearIncrementEvent extends SchedulerEvent {
  @override
  List<Object> get props => [];
}

class YearDecrementEvent extends SchedulerEvent {
  @override
  List<Object> get props => [];
}

class DaySelectionEvent extends SchedulerEvent {
  int selectedDay;

  @override
  List<Object> get props => [];

  DaySelectionEvent({int selectedDay});
}

class TimeSelectionEvent extends SchedulerEvent {
  @override
  List<Object> get props => [];
}

class DurationSelectionEvent extends SchedulerEvent {
  @override
  List<Object> get props => [];
}

class SubmissionEvent extends SchedulerEvent {
  @override
  List<Object> get props => [];
}
