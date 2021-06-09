import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AppointmentState extends Equatable {
  @override
  List<Object> get props => [];
}

class EmptyState extends AppointmentState {}

class BookedState extends AppointmentState {
  List todaysSchedules, otherSchedules;

  BookedState({
    @required this.todaysSchedules,
    @required this.otherSchedules,
  });

  List<Object> get props => [
        this.todaysSchedules,
        this.otherSchedules,
      ];
}

class BookingInProgressState extends AppointmentState {}

class FetchingErrorState extends AppointmentState {}
