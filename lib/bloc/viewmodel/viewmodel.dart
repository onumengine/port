import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/categories/event.dart';
import 'package:port/bloc/categories/state.dart';
import 'package:port/bloc/scheduler/event.dart';
import 'package:port/bloc/scheduler/state.dart';
import 'package:port/repository/api_client.dart';
import 'package:port/utility/constants.dart';

class ViewModel extends Bloc {
  // Categories screen fields
  ApiClient _apiClient = ApiClient();
  Map<String, dynamic> response;
  var errorMessage, listOfCategories;

  @override
  get initialState => throw UnimplementedError();

  @override
  Stream mapEventToState(event) async* {
    if (event is CategoriesFetchEvent) {
      yield CategoriesFetchingState();
      try {
        await _fetchFromApi(CATEGORIES_FETCH_PATH);
        listOfCategories = response["data"];
        yield CategoriesFetchedState(categories: listOfCategories);
      } catch (e) {
        errorMessage = e.toString();
        yield CategoriesErrorState(errorMessage: errorMessage);
      }
    }
  }

  Future<void> _fetchFromApi(String apiPath) async {
    response = jsonDecode(await _apiClient.get(apiPath));
  }
}
