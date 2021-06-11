import 'package:equatable/equatable.dart';

abstract class NotificationsEvent extends Equatable {}

class NotificationsFetchEvent extends NotificationsEvent {
  @override
  List<Object> get props => [];
}

class NotificationsFetchSuccessEvent extends NotificationsEvent {
  @override
  List<Object> get props => [];
}

class NotificationsFetchErrorEvent extends NotificationsEvent {
  @override
  List<Object> get props => [];
}
