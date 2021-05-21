import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/scheduler/event.dart';
import 'package:port/bloc/scheduler/state.dart';

class SchedulerBloc extends Bloc<SchedulerEvent, SchedulerState> {
  DateTime selectedDateTime;
  int selectedYear, selectedMonth, selectedDay, numberOfDaysInSelectedMonth;
  bool isSelected;

  @override
  SchedulerState get initialState => throw UnimplementedError();

  @override
  Stream<SchedulerState> mapEventToState(SchedulerEvent event) async* {
    throw UnimplementedError();
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

  void incrementSelectedDay() {
    selectedDay++;
  }

  void decrementSelectedDay() {
    selectedDay--;
  }
}
