import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/users/event.dart';
import 'package:port/bloc/users/state.dart';
import 'package:port/repository/api_client.dart';
import 'package:port/utility/constants.dart';

class UsersBloc extends Bloc<UsersScreenEvent, UsersScreenState> {
  ApiClient _apiClient = ApiClient();
  Map<String, dynamic> response;
  List listOfUsers;
  int selectedUserId;
  String userOrganizationName;

  @override
  UsersScreenState get initialState => PopulatedUsersState();

  @override
  Stream<UsersScreenState> mapEventToState(UsersScreenEvent event) async* {
    if (event is UsersFetchEvent) {
      yield FetchingUsersState();
      try {
        await _fetchUsers(event.usersOrganizationId);
        listOfUsers = response["data"];
        print("YOUR LIST OF USERS IS: $listOfUsers");
        userOrganizationName = event.usersOrganizationName;
        print("YOUR ORGANIZATION NAME IS $userOrganizationName");
        yield PopulatedUsersState(users: listOfUsers, userOrganizationName: userOrganizationName,);
      } catch (error) {
        yield FetchingErrorState(errorMessage: error.toString());
      }
    } else if (event is UserSubmitEvent) {
      selectedUserId = event.selectedUserId;
      yield PopulatedUsersState(users: listOfUsers);
    }
  }

  Future<void> _fetchUsers(String usersOrganizationId) async {
    response = jsonDecode(await _apiClient.get(USERS_FETCH_PATH + usersOrganizationId));
    print("YOUR RESPONSE IS: $response");
  }
}
