import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class NotificationsState extends Equatable {}

class EmptyNotificationsState extends NotificationsState {
  @override
  List<Object> get props => [];
}

class NotificationsRefreshingState extends NotificationsState {
  @override
  List<Object> get props => [];
}

class PopulatedNotificationsState extends NotificationsState {
  final List notifications;

  PopulatedNotificationsState({@required this.notifications});

  @override
  List<Object> get props => [this.notifications];
}

class NotificationsFetchUnsuccessfulState extends NotificationsState {
  @override
  List<Object> get props => [];
}
