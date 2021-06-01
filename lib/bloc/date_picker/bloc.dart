import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/date_picker/event.dart';
import 'package:port/bloc/date_picker/state.dart';

class DatePickerBloc extends Bloc<DatePickerEvent, DatePickerState> {

  int selectedYear, selectedMonth, selectedDay;

  DatePickerBloc() {
    selectedYear = DateTime.now().year;
    selectedMonth = DateTime.now().month;
    selectedDay = DateTime.now().day;
  }

  @override
  DatePickerState get initialState => DatePickerState(
    selectedYear: DateTime.now().year,
    selectedMonth: DateTime.now().month,
    selectedDay: DateTime.now().day,
  );

  @override
  Stream<DatePickerState> mapEventToState(DatePickerEvent event) {
    throw UnimplementedError();
  }
}