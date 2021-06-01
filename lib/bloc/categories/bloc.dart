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
      var response, responseObject, categoriesList;
      try {
        response = _apiClient.get(CATEGORIES_FETCH_PATH);
        responseObject = Future.value(responseObject);
        print("The response from fetching categories is $responseObject");
        categoriesList = responseObject["data"];
        print("The list of categories in the BLoC is $categoriesList");
        yield CategoriesFetchedState(categories: response);
      } on FetchDataException catch (e) {
        print("Categories fetch caught an error. ERROR: $e");
        yield ErrorState(errorMessage: e.toString());
      } finally {
        yield CategoriesFetchedState(categories: response["data"]);
      }
    }
  }
}
