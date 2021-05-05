import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class BookingState extends Equatable {
  @override
  List<Object> get props => [];
}

class BookedState extends BookingState {
  @override
  List<Object> get props => [];
}

class UnbookedState extends BookingState {
  @override
  List<Object> get props => [];
}

class BookingInProgressState extends BookingState {
  @override
  List<Object> get props => [];
}

class BookingError extends BookingState {
  @override
  List<Object> get props => [];
}