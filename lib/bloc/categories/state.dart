import 'package:equatable/equatable.dart';

abstract class CategoriesState extends Equatable {
}

class CategoriesInitialState extends CategoriesState {
  @override
  List<Object> get props => [];
}

class ErrorState extends CategoriesState {
  @override
  List<Object> get props => [];
}
