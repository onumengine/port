import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/notifications/event.dart';
import 'package:port/bloc/notifications/state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  @override
  NotificationsState get initialState => EmptyNotificationsState();

  @override
  Stream<NotificationsState> mapEventToState(NotificationsEvent event) async* {
    if (event is NotificationsFetchEvent) {
      yield NotificationsRefreshingState();
    } else if (event is NotificationsFetchSuccessEvent) {
      yield NonEmptyNotificationsState();
    } else if (event is NotificationsFetchErrorEvent) {
      yield NotificationsFetchUnsuccessfulState();
    }
  }
}
