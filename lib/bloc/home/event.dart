import 'package:equatable/equatable.dart';

abstract class AppointmentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class BookingEvent extends AppointmentEvent {
  @override
  List<Object> get props => [];
}
