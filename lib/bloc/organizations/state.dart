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

class NonEmptyOrganizationsState extends OrganizationsState {
  @override
  List<Object> get props => [];
}

class OrganizationsFetchingErrorState extends OrganizationsState {
  @override
  List<Object> get props => [];
}
