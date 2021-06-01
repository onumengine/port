import 'package:equatable/equatable.dart';

class DatePickerState extends Equatable {
  int selectedYear,
      selectedMonth,
      selectedDay,
      numberOfDaysInSelectedMonth,
      weekdayToRenderFrom,
      itemCount;

  DatePickerState({
    this.selectedYear,
    this.selectedMonth,
    this.selectedDay,
    this.numberOfDaysInSelectedMonth,
    this.weekdayToRenderFrom,
    this.itemCount,
  });

  @override
  List<Object> get props => [
        selectedYear,
        selectedMonth,
        selectedDay,
        numberOfDaysInSelectedMonth,
        weekdayToRenderFrom,
        itemCount
      ];
}
