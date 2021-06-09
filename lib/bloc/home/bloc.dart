import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/home/event.dart';
import 'package:port/bloc/home/state.dart';
import 'package:port/repository/api_client.dart';
import 'package:port/utility/constants.dart';

class HomeBloc extends Bloc<AppointmentEvent, AppointmentState> {
  ApiClient _apiClient = ApiClient();
  var response;

  @override
  get initialState => EmptyState();

  @override
  Stream<AppointmentState> mapEventToState(AppointmentEvent event) async* {
    if (event is SchedulesFetchEvent) {
      try {
        await _fetchSchedules();
        yield BookedState(schedules: response["data"]);
      } catch (e) {
        print("SCHEDULE FETCH ENDED WITH AN ERROR: $e");
      }
    }
  }

  _fetchSchedules() async {
    response = await _apiClient.get(CATEGORIES_FETCH_PATH);
    print("YOUR SCHEDULES ARE: $response");
  }
}
