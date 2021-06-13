import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/home/event.dart';
import 'package:port/bloc/home/state.dart';
import 'package:port/repository/api_client.dart';
import 'package:port/utility/constants.dart';

class HomeBloc extends Bloc<AppointmentEvent, AppointmentState> {
  ApiClient _apiClient = ApiClient();
  var response;

  @override
  get initialState => AppointmentsFetchingState();

  @override
  Stream<AppointmentState> mapEventToState(AppointmentEvent event) async* {
    if (event is SchedulesFetchEvent) {
      yield AppointmentsFetchingState();
      try {
        await _fetchSchedules();
        yield BookedState(
          todaysSchedules: response["today"],
          otherSchedules: response["others"],
        );
      } catch (e) {
        print("SCHEDULE FETCH ENDED WITH AN ERROR: $e");
        yield FetchingErrorState();
      }
    }
  }

  _fetchSchedules() async {
    response = jsonDecode(await _apiClient.get(SCHEDULES_FETCH_PATH));
    print("YOUR SCHEDULES ARE: $response");
  }
}
