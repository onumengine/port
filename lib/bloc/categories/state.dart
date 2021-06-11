import 'package:equatable/equatable.dart';

abstract class CategoriesState extends Equatable {
  @override
  List<Object> get props => [];
}

class CategoriesInitialState extends CategoriesState {}

class CategoriesFetchingState extends CategoriesState {}

class CategoriesFetchedState extends CategoriesState {
  final List<dynamic> categories;

  CategoriesFetchedState({this.categories});

  @override
  List<Object> get props => [categories];
}

class CategoriesErrorState extends CategoriesState {
  final String errorMessage;

  CategoriesErrorState({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
