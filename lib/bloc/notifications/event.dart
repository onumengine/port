import 'package:equatable/equatable.dart';

abstract class NotificationEvent extends Equatable {}

class NotificationRefreshEvent extends NotificationEvent {
  @override
  List<Object> get props => [];
}

class NotificationRefreshErrorEvent extends NotificationEvent {
  @override
  List<Object> get props => [];
}
