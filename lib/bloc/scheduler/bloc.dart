import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/scheduler/event.dart';
import 'package:port/bloc/scheduler/state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SchedulerBloc extends Bloc<SchedulerEvent, SchedulerScreenState> {
  int _selectedTimeButtonIndex, _selectedDurationButtonIndex;
  String _selectedTime;
  String _selectedDuration;
  SharedPreferences _preferences;
  Map<int, String> _indicesToTimes = {
    0: "08:30",
    1: "09:00",
    2: "09:30",
    3: "10:00",
    4: "10:30",
    5: "11:00",
  };
  Map<int, String> _indicesToDurations = {
    0: "30mins",
    1: "1hr",
    2: "2hrs",
  };

  @override
  SchedulerScreenState get initialState => ScheduleState(
        availableTimes: _indicesToTimes,
        availableDurations: _indicesToDurations,
      );

  @override
  Stream<SchedulerScreenState> mapEventToState(SchedulerEvent event) async* {
    if (event is TimeSelectionEvent) {
      _selectedTimeButtonIndex = event.selectedButtonIndex;
      _selectedTime = _indicesToTimes[_selectedTimeButtonIndex];
      yield ScheduleState(
        selectedTimeButtonIndex: _selectedTimeButtonIndex,
        selectedDurationButtonIndex: _selectedDurationButtonIndex,
        availableTimes: _indicesToTimes,
        availableDurations: _indicesToDurations,
      );
    } else if (event is DurationSelectionEvent) {
      _selectedDurationButtonIndex = event.selectedButtonIndex;
      _selectedDuration = _indicesToDurations[_selectedDurationButtonIndex];
      yield ScheduleState(
        selectedTimeButtonIndex: _selectedTimeButtonIndex,
        selectedDurationButtonIndex: _selectedDurationButtonIndex,
        availableTimes: _indicesToTimes,
        availableDurations: _indicesToDurations,
      );
    } else if (event is ScheduleSubmissionEvent) {
      if (_selectedTime != null && _selectedDuration != null) {
        try {
          _preferences = await SharedPreferences.getInstance();
          print(
              "YOUR PREFERENCES BEFORE ASSIGNMENT ARE: ${_preferences.getKeys()}");
          _preferences.setString("time", _selectedTime);
          _preferences.setString("duration", _selectedDuration);
          print("YOUR PREFERENCE KEYS ARE NOW: ${_preferences.getKeys()}");
          yield ScheduleClearForSubmissionState(
            selectedTimeButtonIndex: _selectedTimeButtonIndex,
            selectedDurationButtonIndex: _selectedDurationButtonIndex,
            availableTimes: _indicesToTimes,
            availableDurations: _indicesToDurations,
            proceedToSubmission: true,
          );
        } catch (e) {
          print("SHARED_PREFERENCES ASSIGNMENT FAILED WITH AN EXCEPTION: $e");
        }
      } else {
        print("YOU HAVE TO SET BOTH YOUR TIME AND DURATION FIRST");
        yield ScheduleClearForSubmissionState(
          selectedTimeButtonIndex: _selectedTimeButtonIndex,
          selectedDurationButtonIndex: _selectedDurationButtonIndex,
          availableTimes: _indicesToTimes,
          availableDurations: _indicesToDurations,
        );
      }
    }
  }
}
