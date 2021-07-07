import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/date_picker/event.dart';
import 'package:port/bloc/date_picker/state.dart';
import 'package:shared_preferences/shared_preferences.dart';

///  ## HOW THIS DATE_PICKER POPULATES ITS DAYS
///
///  1. Select or switch to a new month.
///  2. Update the [_selectedMonth] variable.
///  3. Check the first weekday of the month.
///  4. Update the [_firstWeekdayOfSelectedMonth] variable.
///  5. Calculate the grid index to start rendering bubbles from.
///  6. Store this value in a variable [_indexToRenderFrom].
///  7. GridBuilder will render empty containers from index 0 to index [_indexToRenderFrom] - 1.
///  8. GridBuilder will render [CalendarBubble]s from index [_indexToRenderFrom] to
///     the [_numberOfDaysInSelectedMonth].
///  9. Find a way to get the number of days in a month.
/// 10. Make number of [CalendarBubble]s rendered by GridBuilder equal to the number
///     of days in a month

class DatePickerBloc extends Bloc<DatePickerEvent, DatePickerState> {
  int _selectedYear;

  _incrementSelectedYear() {
    _selectedYear++;
  }

  _decrementSelectedYear() {
    _selectedYear--;
  }

  int _selectedMonth;

  _incrementSelectedMonth() {
    _selectedMonth++;
  }

  _decrementSelectedMonth() {
    _selectedMonth--;
  }

  int _selectedDay;

  void _setSelectedDay(int day) {
    _selectedDay = day;
  }

  int _firstWeekdayOfSelectedMonth;
  int _numberOfDaysInSelectedMonth;
  int _numberOfGridItemsToRender;
  int _indexToRenderFrom;

  String _finalDate;

  _setFinalDate() {
    this._finalDate = "$_selectedYear-$_selectedMonth-$_selectedDay";
    print("THE FINAL DATE IN THE BLOC IS $_finalDate");
  }

  SharedPreferences _preferences;

  Map<int, String> _numberToDayMap = <int, String>{
    1: "Monday",
    2: "Tuesday",
    3: "Wednesday",
    4: "Thursday",
    5: "Friday",
    6: "Saturday",
    7: "Sunday",
  };

  DatePickerBloc() {
    _selectedYear = DateTime.now().year;
    _selectedMonth = DateTime.now().month;
    _firstWeekdayOfSelectedMonth = DateTime.now().weekday;
    _numberOfDaysInSelectedMonth =
        DateTime(DateTime.now().year, (DateTime.now().month + 1), 0).day;
    _numberOfGridItemsToRender = DateTime.now().weekday +
        DateTime(DateTime.now().year, (DateTime.now().month + 1), 0).day -
        1;
    add(DaySelectionEvent(DateTime.now().day));
  }

  @override
  DatePickerState get initialState => DatePickerState(
        selectedYear: DateTime.now().year,
        selectedMonth: DateTime.now().month,
        weekdayToRenderFrom: DateTime.now().weekday - 1,
        numberOfDaysInSelectedMonth:
            DateTime(DateTime.now().year, (DateTime.now().month + 1), 0).day,
        itemCount: DateTime.now().weekday +
            DateTime(DateTime.now().year, (DateTime.now().month + 1), 0).day -
            1,
      );

  @override
  Stream<DatePickerState> mapEventToState(DatePickerEvent event) async* {
    if (event is YearIncrementEvent) {
      _incrementSelectedYear();
      _updateRemainingFields();
      yield DatePickerState(
        selectedYear: _selectedYear,
        selectedMonth: _selectedMonth,
        selectedDay: _selectedDay,
        weekdayToRenderFrom: _indexToRenderFrom,
        numberOfDaysInSelectedMonth: _numberOfDaysInSelectedMonth,
        itemCount: _numberOfGridItemsToRender,
      );
    } else if (event is YearDecrementEvent) {
      _decrementSelectedYear();
      _updateRemainingFields();
      yield DatePickerState(
        selectedYear: _selectedYear,
        selectedMonth: _selectedMonth,
        selectedDay: _selectedDay,
        weekdayToRenderFrom: _indexToRenderFrom,
        numberOfDaysInSelectedMonth: _numberOfDaysInSelectedMonth,
        itemCount: _numberOfGridItemsToRender,
      );
    } else if (event is MonthIncrementEvent) {
      _incrementSelectedMonth();
      _updateRemainingFields();
      yield DatePickerState(
        selectedYear: _selectedYear,
        selectedMonth: _selectedMonth,
        selectedDay: _selectedDay,
        weekdayToRenderFrom: _indexToRenderFrom,
        numberOfDaysInSelectedMonth: _numberOfDaysInSelectedMonth,
        itemCount: _numberOfGridItemsToRender,
      );
    } else if (event is MonthDecrementEvent) {
      _decrementSelectedMonth();
      _updateRemainingFields();
      yield DatePickerState(
        selectedYear: _selectedYear,
        selectedMonth: _selectedMonth,
        selectedDay: _selectedDay,
        weekdayToRenderFrom: _indexToRenderFrom,
        numberOfDaysInSelectedMonth: _numberOfDaysInSelectedMonth,
        itemCount: _numberOfGridItemsToRender,
      );
    } else if (event is DaySelectionEvent) {
      _setSelectedDay(event.day);
      _updateRemainingFields();
      await _saveDateToSharedPreferences();
      yield DatePickerState(
        selectedYear: _selectedYear,
        selectedMonth: _selectedMonth,
        selectedDay: _selectedDay,
        weekdayToRenderFrom: _indexToRenderFrom,
        numberOfDaysInSelectedMonth: _numberOfDaysInSelectedMonth,
        itemCount: _numberOfGridItemsToRender,
      );
    }
  }

  Future<void> _saveDateToSharedPreferences() async {
    try {
      _preferences = await SharedPreferences.getInstance();
      print(
          "YOUR PREFERENCES BEFORE ASSIGNMENT ARE: ${_preferences.getKeys()}");
      _preferences.setString(
          "date", "$_selectedYear-$_selectedMonth-$_selectedDay");
      print("YOUR PREFERENCE KEYS ARE NOW: ${_preferences.getKeys()}");
    } catch (e) {
      print("SHARED_PREFERENCES ASSIGNMENT FAILED WITH AN EXCEPTION: $e");
    }
  }

  void _updateRemainingFields() {
    _firstWeekdayOfSelectedMonth =
        DateTime(_selectedYear, _selectedMonth, 1).weekday;
    _numberOfDaysInSelectedMonth =
        DateTime(_selectedYear, (_selectedMonth + 1), 0).day;
    _numberOfGridItemsToRender =
        _firstWeekdayOfSelectedMonth + _numberOfDaysInSelectedMonth;
    _indexToRenderFrom = (DateTime(_selectedYear, _selectedMonth, 1).weekday);
  }
}
