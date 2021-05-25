import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/scheduler/event.dart';
import 'package:port/bloc/scheduler/state.dart';

class SchedulerBloc extends Bloc<SchedulerEvent, SchedulerState> {
  DateTime selectedDateTime = DateTime.now();
  int selectedYear = DateTime.now().year;
  int selectedMonth = DateTime.now().month;
  int selectedDay, numberOfDaysInSelectedMonth, firstDayOfSelectedMonth;
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

  @override
  void onEvent(SchedulerEvent event) {
    super.onEvent(event);
  }

  @override
  SchedulerState get initialState => throw UnimplementedError();

  @override
  Stream<SchedulerState> mapEventToState(SchedulerEvent event) async* {
    if (event is YearIncrementEvent) {
      incrementSelectedYear();
      yield ScheduleState(
        selectedDateTime: selectedDateTime,
        selectedYear: selectedYear,
        selectedMonth: selectedMonth,
        selectedDay: selectedDay,
      );
    } else if (event is YearDecrementEvent) {
      decrementSelectedYear();
      yield ScheduleState(
        selectedDateTime: selectedDateTime,
        selectedYear: selectedYear,
        selectedMonth: selectedMonth,
        selectedDay: selectedDay,
      );
    } else if (event is MonthIncrementEvent) {
      incrementSelectedMonth();
      yield ScheduleState(
        selectedDateTime: selectedDateTime,
        selectedYear: selectedYear,
        selectedMonth: selectedMonth,
        selectedDay: selectedDay,
      );
    } else if (event is MonthDecrementEvent) {
      decrementSelectedMonth();
      yield ScheduleState(
        selectedDateTime: selectedDateTime,
        selectedYear: selectedYear,
        selectedMonth: selectedMonth,
        selectedDay: selectedDay,
      );
    } else if (event is DaySelectionEvent) {
      setSelectedDay(event.selectedDay);
      yield ScheduleState(
        selectedDateTime: selectedDateTime,
        selectedYear: selectedYear,
        selectedMonth: selectedMonth,
        selectedDay: selectedDay,
      );
    }
  }

  void setNumberOfDaysInSelectedMonth() {
    numberOfDaysInSelectedMonth =
        DateTime(selectedYear, selectedMonth + 1, 0).day;
  }

  void setFirstDayOfSelectedMonth() {
    firstDayOfSelectedMonth = selectedDateTime.weekday;
  }

  int getNumberOfCalendarSpacesToSkip() {
    if (firstDayOfSelectedMonth == null) {
      setFirstDayOfSelectedMonth();
    }
    return firstDayOfSelectedMonth - 1;
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
