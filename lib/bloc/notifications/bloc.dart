import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/notifications/event.dart';
import 'package:port/bloc/notifications/state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  @override
  NotificationState get initialState => EmptyNotificationState();
}
