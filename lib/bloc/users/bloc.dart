import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/users/event.dart';
import 'package:port/bloc/users/state.dart';

class UsersBloc extends Bloc<UsersScreenEvent, UsersScreenState> {
  @override
  UsersScreenState get initialState => PopulatedUsersState();

  @override
  Stream<UsersScreenState> mapEventToState(UsersScreenEvent event) async* {
    if (event is UsersFetchEvent) {
      yield FetchingUsersState();
    } else if (event is UsersFetchingComplete) {
      yield PopulatedUsersState();
    } else if (event is UsersFetchingError) {
      yield FetchingErrorState();
    } else {
      yield UnfetchedUsersState();
    }
  }
}
