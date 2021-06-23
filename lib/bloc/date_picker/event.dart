import 'package:equatable/equatable.dart';

abstract class DatePickerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class YearIncrementEvent extends DatePickerEvent {}

class YearDecrementEvent extends DatePickerEvent {}

class MonthIncrementEvent extends DatePickerEvent {}

class MonthDecrementEvent extends DatePickerEvent {}

class DaySelectionEvent extends DatePickerEvent {
  int day;

  DaySelectionEvent(this.day);

  @override
  List<Object> get props => [this.day];
}
