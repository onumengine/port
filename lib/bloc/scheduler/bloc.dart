import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/scheduler/event.dart';
import 'package:port/bloc/scheduler/state.dart';


class SchedulerBloc extends Bloc<SchedulerEvent, SchedulerScreenState> {
  var selectedTime, selectedDuration;
  int selectedTimeButtonIndex;

  @override
  SchedulerScreenState get initialState => ScheduleState();

  @override
  Stream<SchedulerScreenState> mapEventToState(SchedulerEvent event) async* {
    if (event is TimeSelectionEvent) {
      selectedTimeButtonIndex = event.selectedButtonIndex;
      yield ScheduleState(selectedTimeButtonIndex: selectedTimeButtonIndex);
    } else if (event is DurationSelectionEvent) {
      yield ScheduleState();
    }
  }
}
