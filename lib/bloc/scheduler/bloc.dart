import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/scheduler/event.dart';
import 'package:port/bloc/scheduler/state.dart';

class SchedulerBloc extends Bloc<SchedulerEvent, SchedulerScreenState> {
  int selectedTimeButtonIndex, selectedDurationButtonIndex;
  String selectedTime;
  String selectedDuration;
  Map<int, String> indicesToTimes = {
    0: "08:30",
    1: "09:00",
    2: "09:30",
    3: "10:00",
    4: "10:30",
    5: "11:00",
  };
  Map<int, String> indicesToDurations = {
    0: "30mins",
    1: "1hr",
    2: "2hrs",
  };

  @override
  SchedulerScreenState get initialState => ScheduleState(
        availableTimes: indicesToTimes,
        availableDurations: indicesToDurations,
      );

  @override
  Stream<SchedulerScreenState> mapEventToState(SchedulerEvent event) async* {
    if (event is TimeSelectionEvent) {
      selectedTimeButtonIndex = event.selectedButtonIndex;
      selectedTime = indicesToTimes[selectedTimeButtonIndex];
      yield ScheduleState(
        selectedTimeButtonIndex: selectedTimeButtonIndex,
        selectedDurationButtonIndex: selectedDurationButtonIndex,
        availableTimes: indicesToTimes,
        availableDurations: indicesToDurations,
      );
    } else if (event is DurationSelectionEvent) {
      selectedDurationButtonIndex = event.selectedButtonIndex;
      selectedDuration = indicesToDurations[selectedDurationButtonIndex];
      yield ScheduleState(
        selectedTimeButtonIndex: selectedTimeButtonIndex,
        selectedDurationButtonIndex: selectedDurationButtonIndex,
        availableTimes: indicesToTimes,
        availableDurations: indicesToDurations,
      );
    }
  }
}
