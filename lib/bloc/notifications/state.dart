import 'package:equatable/equatable.dart';

abstract class NotificationsState extends Equatable {}

class EmptyNotificationsState extends NotificationsState {
  @override
  List<Object> get props => [];
}

class NotificationsRefreshingState extends NotificationsState {
  @override
  List<Object> get props => [];
}

class NonEmptyNotificationsState extends NotificationsState {
  @override
  List<Object> get props => [];
}

class NotificationsFetchUnsuccessfulState extends NotificationsState {
  @override
  List<Object> get props => [];
}
