import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/date_picker/event.dart';
import 'package:port/bloc/date_picker/state.dart';

class DatePickerBloc extends Bloc<DatePickerEvent, DatePickerState> {

  int selectedYear;
  int selectedMonth;
  int selectedDay;
  int firstDayOfSelectedMonth;
  int numberOfDaysInSelectedMonth;
  int numberOfGridItemsToRender;
  int weekdayToRenderFrom;

  DatePickerBloc() {
    selectedYear = DateTime.now().year;
    selectedMonth = DateTime.now().month;
    selectedDay = DateTime.now().day;
    firstDayOfSelectedMonth = DateTime.now().weekday;
    numberOfDaysInSelectedMonth = DateTime(DateTime.now().year, (DateTime.now().month + 1), 0).day;
    numberOfGridItemsToRender = DateTime.now().weekday + DateTime(DateTime.now().year, (DateTime.now().month + 1), 0).day - 1;
  }

  @override
  DatePickerState get initialState => DatePickerState(
    selectedYear: DateTime.now().year,
    selectedMonth: DateTime.now().month,
    selectedDay: DateTime.now().day,
    weekdayToRenderFrom: DateTime.now().weekday - 1,
    numberOfDaysInSelectedMonth: DateTime(DateTime.now().year, (DateTime.now().month + 1), 0).day,
    itemCount: DateTime.now().weekday + DateTime(DateTime.now().year, (DateTime.now().month + 1), 0).day - 1,
  );

  @override
  Stream<DatePickerState> mapEventToState(DatePickerEvent event) async* {
    if (event is YearIncrementEvent) {
      selectedYear++;
      firstDayOfSelectedMonth = DateTime(selectedYear, selectedMonth, selectedDay).weekday;
      numberOfDaysInSelectedMonth = DateTime(selectedYear, (selectedMonth + 1), 0).day;
      numberOfGridItemsToRender = firstDayOfSelectedMonth + numberOfDaysInSelectedMonth - 1;
      weekdayToRenderFrom = (DateTime(selectedYear, selectedMonth, selectedDay).weekday) - 1;
      yield DatePickerState(
        selectedYear: selectedYear,
        selectedMonth: selectedMonth,
        selectedDay: selectedDay,
        weekdayToRenderFrom: weekdayToRenderFrom,
        numberOfDaysInSelectedMonth: numberOfDaysInSelectedMonth,
        itemCount: numberOfGridItemsToRender,
      );
    } else if (event is YearDecrementEvent) {
      selectedYear--;
      firstDayOfSelectedMonth = DateTime(selectedYear, selectedMonth, selectedDay).weekday;
      numberOfDaysInSelectedMonth = DateTime(selectedYear, (selectedMonth + 1), 0).day;
      numberOfGridItemsToRender = firstDayOfSelectedMonth + numberOfDaysInSelectedMonth - 1;
      weekdayToRenderFrom = (DateTime(selectedYear, selectedMonth, selectedDay).weekday) - 1;
      yield DatePickerState(
        selectedYear: selectedYear,
        selectedMonth: selectedMonth,
        selectedDay: selectedDay,
        weekdayToRenderFrom: weekdayToRenderFrom,
        numberOfDaysInSelectedMonth: numberOfDaysInSelectedMonth,
        itemCount: numberOfGridItemsToRender,
      );
    } else if (event is MonthIncrementEvent) {
      yield DatePickerState();
    } else if (event is MonthDecrementEvent) {
      yield DatePickerState();
    } else if (event is DaySelectionEvent) {
      selectedDay = event.day;
      yield DatePickerState();
    }
  }
}