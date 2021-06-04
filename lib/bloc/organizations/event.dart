import 'package:equatable/equatable.dart';

abstract class OrganizationsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OrganizationsFetchEvent extends OrganizationsEvent {
  String categoryId;

  OrganizationsFetchEvent({this.categoryId});

  @override
  List<Object> get props => [this.categoryId];
}
