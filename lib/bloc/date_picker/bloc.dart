import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/date_picker/event.dart';
import 'package:port/bloc/date_picker/state.dart';

class DatePickerBloc extends Bloc<DatePickerEvent, DatePickerState> {
  @override
  DatePickerState get initialState => throw UnimplementedError();

  @override
  Stream<DatePickerState> mapEventToState(DatePickerEvent event) {
    throw UnimplementedError();
  }
}