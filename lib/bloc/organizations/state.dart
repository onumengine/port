import 'package:equatable/equatable.dart';

abstract class OrganizationsState extends Equatable {}

class EmptyOrganizationsState extends OrganizationsState {
  @override
  List<Object> get props => [];
}

class OrganizationsFetchingState extends OrganizationsState {
  @override
  List<Object> get props => [];
}

class PopulatedOrganizationsState extends OrganizationsState {
  List<dynamic> organizations;

  PopulatedOrganizationsState({this.organizations});

  @override
  List<Object> get props => [this.organizations];
}

class OrganizationsFetchingErrorState extends OrganizationsState {
  @override
  List<Object> get props => [];
}
