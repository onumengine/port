import 'package:equatable/equatable.dart';

abstract class SchedulerScreenState extends Equatable {}

class ScheduleState extends SchedulerScreenState {
  int selectedTimeButtonIndex;

  ScheduleState({this.selectedTimeButtonIndex});

  @override
  List<Object> get props => [this.selectedTimeButtonIndex];
}
