import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/notifications/event.dart';
import 'package:port/bloc/notifications/state.dart';
import 'package:port/repository/api_client.dart';
import 'package:port/utility/constants.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  ApiClient _apiClient = ApiClient();
  var _apiResponse;
  List notifications;

  @override
  NotificationsState get initialState => EmptyNotificationsState();

  @override
  Stream<NotificationsState> mapEventToState(NotificationsEvent event) async* {
    if (event is NotificationsFetchEvent) {
      yield NotificationsRefreshingState();
      try {
        await _fetchNotifications();
        _initializeNotificationsWithData(_apiResponse);
        yield PopulatedNotificationsState(notifications: notifications);
      } catch (e) {
        print("THE FOLLOWING NOTIFICATIONS ERROR HAS BEEN THROWN: $e");
        yield NotificationsFetchUnsuccessfulState();
      }
    } else if (event is NotificationsFetchSuccessEvent) {
      yield PopulatedNotificationsState(notifications: notifications);
    } else if (event is NotificationsFetchErrorEvent) {
      yield NotificationsFetchUnsuccessfulState();
    }
  }

  _fetchNotifications() async {
    _apiResponse = jsonDecode(await _apiClient.get(NOTIFICATIONS_FETCH_PATH));
    print(_apiResponse);
  }

  _initializeNotificationsWithData(Map<String, dynamic> data) {
    notifications = data["data"];
    print("YOUR NOTIFICATIONS ARE: $notifications");
  }
}
