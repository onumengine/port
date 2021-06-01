import 'package:equatable/equatable.dart';

class DatePickerState extends Equatable {
  int selectedYear,
      selectedMonth,
      selectedDay,
      numberOfDaysInSelectedMonth,
      numberOfCalendarSpacesToSkip;

  DatePickerState({
    selectedYear,
    selectedMonth,
    selectedDay,
    numberOfDaysInSelectedMonth,
    numberOfCalendarSpacesToSkip,
  });

  @override
  List<Object> get props => [
        selectedYear,
        selectedMonth,
        selectedDay,
        numberOfDaysInSelectedMonth,
        numberOfCalendarSpacesToSkip,
      ];
}
