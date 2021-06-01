import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/categories/event.dart';
import 'package:port/bloc/categories/state.dart';
import 'package:port/repository/api_client.dart';
import 'package:port/repository/app_exceptions.dart';
import 'package:port/utility/constants.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  ApiClient _apiClient = ApiClient();

  @override
  CategoriesState get initialState => CategoriesInitialState();

  @override
  Stream<CategoriesState> mapEventToState(CategoriesEvent event) async* {
    if (event is CategoriesFetchEvent) {
      yield CategoriesFetchingState();
      try {
        var response = await _apiClient.get(CATEGORIES_FETCH_PATH);
        print("The response from fetching categories is $response");
        yield CategoriesFetchedState();
      } on FetchDataException catch (e) {
        print("Categories fetch caught an error. ERROR: $e");
        yield ErrorState(errorMessage: e.toString());
      }
    }
  }
}
