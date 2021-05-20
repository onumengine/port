import 'package:equatable/equatable.dart';

abstract class CategoriesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchEvent extends CategoriesEvent {}

class CategoriesFetchingError extends CategoriesEvent {}

class CategoriesFetchedEvent extends CategoriesEvent {}

class CategoriesPopulatedSuccessEvent extends CategoriesEvent {}
