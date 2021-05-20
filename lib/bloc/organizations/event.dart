import 'package:equatable/equatable.dart';

abstract class OrganizationsEvent extends Equatable {}

class OrganizationsFetchEvent extends OrganizationsEvent {
  @override
  List<Object> get props => [];
}

class OrganizationsFetchingEvent extends OrganizationsEvent {
  @override
  List<Object> get props => [];
}

class OrganizationsFetchingSuccessEvent extends OrganizationsEvent {
  @override
  List<Object> get props => [];
}

class OrganizationsFetchingErrorEvent extends OrganizationsEvent {
  @override
  List<Object> get props => [];
}
