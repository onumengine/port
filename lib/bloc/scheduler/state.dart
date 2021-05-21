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

class ScheduleState extends SchedulerState {
  DateTime selectedDateTime;
  int selectedYear, selectedMonth, selectedDay, numberOfDaysInSelectedMonth;
  bool isSelected;

  ScheduleState({
    this.selectedDateTime,
    this.selectedYear,
    this.selectedMonth,
    this.selectedDay,
    this.isSelected,
  });

  @override
  List<Object> get props => [];
}
