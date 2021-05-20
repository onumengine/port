import 'package:equatable/equatable.dart';

abstract class NotificationsEvent extends Equatable {}

class NotificationsRefreshEvent extends NotificationsEvent {
  @override
  List<Object> get props => [];
}

class NotificationsRefreshSuccessEvent extends NotificationsEvent {
  @override
  List<Object> get props => [];
}

class NotificationsRefreshErrorEvent extends NotificationsEvent {
  @override
  List<Object> get props => [];
}
