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
  int selectedYear,
      selectedMonth,
      selectedDay,
      numberOfDaysInSelectedMonth,
      numberOfCalendarSpacesToSkip;
  bool isSelected;

  ScheduleState({
    this.selectedDateTime,
    this.selectedYear,
    this.selectedMonth,
    this.selectedDay,
    this.isSelected,
    this.numberOfDaysInSelectedMonth,
    this.numberOfCalendarSpacesToSkip,
  });

  @override
  List<Object> get props => [
        selectedDateTime,
        selectedYear,
        selectedMonth,
        selectedDay,
        numberOfDaysInSelectedMonth,
        this.numberOfCalendarSpacesToSkip,
        isSelected,
      ];
}
