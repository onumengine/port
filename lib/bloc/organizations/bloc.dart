import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/organizations/event.dart';
import 'package:port/bloc/organizations/state.dart';

class OrganizationsBloc extends Bloc<OrganizationsEvent, OrganizationsState> {
  @override
  OrganizationsState get initialState => NonEmptyOrganizationsState();

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
}
