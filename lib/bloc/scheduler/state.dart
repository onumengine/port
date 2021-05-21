import 'package:equatable/equatable.dart';

abstract class SchedulerState extends Equatable {}

class YearChangedState extends SchedulerState {
  @override
  List<Object> get props => [];
}

class MonthChangedState extends SchedulerState {
  @override
  List<Object> get props => [];
}

class DayChangedState extends SchedulerState {
  @override
  List<Object> get props => [];
}
