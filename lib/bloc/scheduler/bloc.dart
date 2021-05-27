import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/scheduler/event.dart';
import 'package:port/bloc/scheduler/state.dart';

class SchedulerBloc extends Bloc<SchedulerEvent, SchedulerState> {
  DateTime selectedDateTime;
  int selectedYear,
      selectedMonth,
      selectedDay,
      numberOfDaysInSelectedMonth,
      firstDayOfSelectedMonth,
      numberOfCalendarSpacesToSkip;
  bool isSelected;
  Map<int, String> numberToMonthMap = <int, String>{
    1: "Jan",
    2: "Feb",
    3: "Mar",
    4: "Apr",
    5: "May",
    6: "Jun",
    7: "Jul",
    8: "Aug",
    9: "Sep",
    10: "Oct",
    11: "Nov",
    12: "Dec",
  };
  Map<int, String> numberToWeekdayMap = <int, String>{
    1: "Mon",
    2: "Tue",
    3: "Wed",
    4: "Thu",
    5: "Fri",
    6: "Sat",
    7: "Sun",
  };

  SchedulerBloc() {
    selectedDateTime = DateTime.now();
    selectedYear = DateTime.now().year;
    selectedMonth = DateTime.now().month;
    selectedDay = DateTime.now().day;
    setNumberOfDaysInSelectedMonth();
  }

  @override
  SchedulerState get initialState => ScheduleState(
        selectedDateTime: DateTime.now(),
        selectedYear: DateTime.now().year,
        selectedMonth: DateTime.now().month,
        selectedDay: DateTime.now().day,
      );

  @override
  Stream<SchedulerState> mapEventToState(SchedulerEvent event) async* {
    if (event is YearIncrementEvent) {
      incrementSelectedYear();
      setNewDateTime();
      setFirstDayOfSelectedMonth();
      setNumberOfCalendarSpacesToSkip();
      setNumberOfDaysInSelectedMonth();
      yield ScheduleState(
        selectedDateTime: selectedDateTime,
        selectedYear: selectedYear,
        selectedMonth: selectedMonth,
        selectedDay: selectedDay,
        numberOfDaysInSelectedMonth: numberOfDaysInSelectedMonth,
        numberOfCalendarSpacesToSkip: numberOfCalendarSpacesToSkip,
      );
    } else if (event is YearDecrementEvent) {
      decrementSelectedYear();
      setNewDateTime();
      setFirstDayOfSelectedMonth();
      setNumberOfCalendarSpacesToSkip();
      setNumberOfDaysInSelectedMonth();
      yield ScheduleState(
        selectedDateTime: selectedDateTime,
        selectedYear: selectedYear,
        selectedMonth: selectedMonth,
        selectedDay: selectedDay,
        numberOfDaysInSelectedMonth: numberOfDaysInSelectedMonth,
        numberOfCalendarSpacesToSkip: numberOfCalendarSpacesToSkip,
      );
    } else if (event is MonthIncrementEvent) {
      incrementSelectedMonth();
      setNewDateTime();
      setFirstDayOfSelectedMonth();
      setNumberOfCalendarSpacesToSkip();
      setNumberOfDaysInSelectedMonth();
      yield ScheduleState(
        selectedDateTime: selectedDateTime,
        selectedYear: selectedYear,
        selectedMonth: selectedMonth,
        selectedDay: selectedDay,
        numberOfDaysInSelectedMonth: numberOfDaysInSelectedMonth,
        numberOfCalendarSpacesToSkip: numberOfCalendarSpacesToSkip,
      );
    } else if (event is MonthDecrementEvent) {
      decrementSelectedMonth();
      setNewDateTime();
      setFirstDayOfSelectedMonth();
      setNumberOfCalendarSpacesToSkip();
      setNumberOfDaysInSelectedMonth();
      yield ScheduleState(
        selectedDateTime: selectedDateTime,
        selectedYear: selectedYear,
        selectedMonth: selectedMonth,
        selectedDay: selectedDay,
        numberOfDaysInSelectedMonth: numberOfDaysInSelectedMonth,
        numberOfCalendarSpacesToSkip: numberOfCalendarSpacesToSkip,
      );
    } else if (event is DaySelectionEvent) {
      setSelectedDay(event.selectedDay);
      setNewDateTime();
      yield ScheduleState(
        selectedDateTime: selectedDateTime,
        selectedYear: selectedYear,
        selectedMonth: selectedMonth,
        selectedDay: selectedDay,
        numberOfDaysInSelectedMonth: numberOfDaysInSelectedMonth,
        numberOfCalendarSpacesToSkip: numberOfCalendarSpacesToSkip,
      );
    }
  }

  void setNewDateTime() {
    selectedDateTime = DateTime(
      selectedYear,
      selectedMonth,
      selectedDay,
    );
  }

  void setNumberOfDaysInSelectedMonth() {
    numberOfDaysInSelectedMonth =
        DateTime(selectedYear, selectedMonth + 1, 0).day;
  }

  void setFirstDayOfSelectedMonth() {
    firstDayOfSelectedMonth = selectedDateTime.weekday;
  }

  void setNumberOfCalendarSpacesToSkip() {
    if (firstDayOfSelectedMonth == null) {
      setFirstDayOfSelectedMonth();
    }
    numberOfCalendarSpacesToSkip = firstDayOfSelectedMonth - 1;
  }

  void incrementSelectedYear() {
    selectedYear++;
  }

  void decrementSelectedYear() {
    selectedYear--;
  }

  void incrementSelectedMonth() {
    selectedMonth++;
  }

  void decrementSelectedMonth() {
    selectedMonth--;
  }

  void setSelectedDay(int newDay) {
    selectedDay = newDay;
  }

  void createNewDateTime() {
    selectedDateTime = DateTime(
      selectedYear,
      selectedMonth,
    );
  }
}
