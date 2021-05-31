import 'package:equatable/equatable.dart';

abstract class CategoriesState extends Equatable {
  @override
  List<Object> get props => [];
}

class CategoriesInitialState extends CategoriesState {
}

class CategoriesFetchingState extends CategoriesState {}

class CategoriesFetchedState extends CategoriesState {
  List<dynamic> categories;

  CategoriesFetchedState({this.categories});

  @override
  List<Object> get props => [categories];
}

class ErrorState extends CategoriesState {
}
