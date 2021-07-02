import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/more/event.dart';
import 'package:port/bloc/more/state.dart';
import 'package:port/model/user.dart';
import 'package:port/repository/user_repository.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> {
  @override
  MoreState get initialState => UserFetchingState();

  @override
  Stream<MoreState> mapEventToState(MoreEvent event) async* {
    if (event is UserFetchEvent) {
      try {
        String userName = await _fetchUser();
        yield UserFetchedState(userName: userName);
      } catch (error) {
        print("FETCHING USERS ENDED WITH AN ERROR: ${error.toString()}");
        yield UserFetchingErrorState();
      }
    }
  }

  Future<String> _fetchUser() async {
    User user = await UserRepository().getCurrentUser();
    String fullName = "${user.firstname} ${user.lastname}";
    return fullName;
  }
}