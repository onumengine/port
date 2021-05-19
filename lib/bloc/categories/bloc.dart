import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/categories/event.dart';
import 'package:port/bloc/categories/state.dart';
import 'package:port/repository/api_client.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  ApiClient _apiClient = ApiClient();

  @override
  // TODO: implement initialState
  get initialState => throw UnimplementedError();

  @override
  Stream<CategoriesState> mapEventToState(CategoriesEvent event) async* {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
