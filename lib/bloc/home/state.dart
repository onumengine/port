import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AppointmentState extends Equatable {
  @override
  List<Object> get props => [];
}

class EmptyState extends AppointmentState {}

class BookedState extends AppointmentState {
  List schedules;

  BookedState({@required this.schedules});

  List<Object> get props => [];
}

class BookingInProgressState extends AppointmentState {}

class BookingError extends AppointmentState {}
