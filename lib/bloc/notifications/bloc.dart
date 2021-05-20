import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/notifications/event.dart';
import 'package:port/bloc/notifications/state.dart';

class NotificationsBloc extends Bloc<NotificationEvent, NotificationsState> {
  @override
  NotificationsState get initialState => EmptyNotificationsState();

  @override
  Stream<NotificationsState> mapEventToState(NotificationEvent event) async* {
    if (event is NotificationRefreshEvent) {
      yield NotificationsRefreshingState();
    } else if (event is NotificationRefreshSuccessEvent) {
      yield NonEmptyNotificationsState();
    } else if (event is NotificationRefreshErrorEvent) {
      yield NotificationsFetchUnsuccessfulState();
    }
  }
}
