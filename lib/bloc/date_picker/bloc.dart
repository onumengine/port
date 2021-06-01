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

  DatePickerBloc() {
    selectedYear = DateTime.now().year;
    selectedMonth = DateTime.now().month;
    selectedDay = DateTime.now().day;
    firstDayOfSelectedMonth = DateTime.now().weekday;
    numberOfDaysInSelectedMonth = DateTime(DateTime.now().year, (DateTime.now().month + 1), 0).day;
    numberOfGridItemsToRender = DateTime.now().weekday + DateTime(DateTime.now().year, (DateTime.now().month + 1), 0).day;
  }

  @override
  DatePickerState get initialState => DatePickerState(
    selectedYear: DateTime.now().year,
    selectedMonth: DateTime.now().month,
    selectedDay: DateTime.now().day,
    weekdayToRenderFrom: DateTime.now().weekday,
    numberOfDaysInSelectedMonth: DateTime(DateTime.now().year, (DateTime.now().month + 1), 0).day,
    itemCount: DateTime.now().weekday + DateTime(DateTime.now().year, (DateTime.now().month + 1), 0).day,
  );

  @override
  Stream<DatePickerState> mapEventToState(DatePickerEvent event) async* {
    if (event is YearIncrementEvent) {
      yield DatePickerState();
    }
  }
}