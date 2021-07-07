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

  DatePickerState.fromDateObject(
    DateTime dateObject, {
    this.numberOfDaysInSelectedMonth,
    this.weekdayToRenderFrom,
    this.itemCount,
  }) {
    this.selectedYear = dateObject.year;
    this.selectedMonth = dateObject.month;
    this.selectedDay = dateObject.day;
  }

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
