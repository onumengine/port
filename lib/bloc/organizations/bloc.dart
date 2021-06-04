import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/organizations/event.dart';
import 'package:port/bloc/organizations/state.dart';
import 'package:port/repository/api_client.dart';
import 'package:port/utility/constants.dart';

class OrganizationsBloc extends Bloc<OrganizationsEvent, OrganizationsState> {
  ApiClient _apiClient = ApiClient();
  var response;

  @override
  OrganizationsState get initialState => EmptyOrganizationsState();

  @override
  Stream<OrganizationsState> mapEventToState(OrganizationsEvent event) async* {
    if (event is OrganizationsFetchingEvent) {
      yield OrganizationsFetchingState();
    } else if (event is OrganizationsFetchingSuccessEvent) {
      yield NonEmptyOrganizationsState();
    } else if (event is OrganizationsFetchingErrorEvent) {
      yield OrganizationsFetchingErrorState();
    }
  }

  Future<void> fetchOrganizations(String organizationId) async {
    response = jsonDecode(await _apiClient.get(CATEGORIES_FETCH_PATH));
    print(response);
  }
}
