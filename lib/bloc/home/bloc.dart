import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/home/event.dart';
import 'package:port/bloc/home/state.dart';

class HomeBloc extends Bloc<AppointmentEvent, AppointmentState> {
  @override
  get initialState => EmptyState();

  @override
  Stream<AppointmentState> mapEventToState(AppointmentEvent event) async* {
    throw UnimplementedError();
  }
}
