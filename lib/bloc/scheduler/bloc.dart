import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/scheduler/event.dart';
import 'package:port/bloc/scheduler/state.dart';

///  ## How this bloc should populate the days
///
///  1. Switch to a new month.
///  2. Update the [selectedMonth] variable.
///  3. Check the first weekday of the month.
///  4. Update the [firstWeekdayOfSelectedMonth] variable.
///  5. Use the variable to calculate the number of days to skip with the method
///     [setNumberOfCalendarSpacesToSkip].
///  6. Store this number in a variable [numberOfCalendarSpacesToSkip].
///  7. GridBuilder will render empty containers from index 0 to index
///     [numberOfCalendarSpacesToSkip - 2]
///  8. GridBuilder will render [CalendarBubble]s from index [numberOfCalendarSpacesToSkip - 2]
///     to the number of days in the month
///  9. Find a way to get the number of days in a month
/// 10. Make number of [CalendarBubble]s rendered by GridBuilder equal to the number
///     of days in the selected month

class SchedulerBloc extends Bloc<SchedulerEvent, SchedulerState> {

  @override
  SchedulerState get initialState => ScheduleState();

  @override
  Stream<SchedulerState> mapEventToState(SchedulerEvent event) async* {
  }
}
