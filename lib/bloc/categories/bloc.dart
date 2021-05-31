import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/categories/event.dart';
import 'package:port/bloc/categories/state.dart';
import 'package:port/repository/api_client.dart';
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
        _apiClient.get(CATEGORIES_FETCH_PATH).then((value) => print);
        yield CategoriesFetchedState();
      } catch (e) {
        print("ERROR: ${e.message}");
      }
    }
  }

  Future<dynamic> _getCategories(String url) {}
}
