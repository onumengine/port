import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/categories/event.dart';
import 'package:port/bloc/categories/state.dart';
import 'package:port/repository/api_client.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final categoriesUrl =
      "http://virtualmerenda.000webhostapp.com/vetlyn/index.php/port/categories";
  ApiClient _apiClient = ApiClient();

  @override
  CategoriesState get initialState => ErrorState();

  @override
  Stream<CategoriesState> mapEventToState(CategoriesEvent event) async* {
    if (event is FetchEvent) {
      try {
        var categories = _apiClient.get(categoriesUrl);
        print(categories);
      } catch (e) {
        print("ERROR: ${e.message}");
      }
    }
  }

  Future<dynamic> _getCategories(String url) {}
}
