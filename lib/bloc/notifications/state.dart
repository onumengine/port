import 'package:equatable/equatable.dart';

abstract class NotificationState extends Equatable {}

class EmptyNotificationState extends NotificationState {
  @override
  List<Object> get props => [];
}

class NonEmptyNotificationState extends NotificationState {
  @override
  List<Object> get props => [];
}

class NotificationFetchUnsuccessfulState extends NotificationState {
  @override
  List<Object> get props => [];
}
