import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class AppointmentState extends Equatable {
  @override
  List<Object> get props => [];
}

class EmptyState extends AppointmentState {
  @override
  List<Object> get props => [];
}

class BookedState extends AppointmentState {
  @override
  List<Object> get props => [];
}

class BookingInProgressState extends AppointmentState {
  @override
  List<Object> get props => [];
}

class BookingError extends AppointmentState {
  @override
  List<Object> get props => [];
}
