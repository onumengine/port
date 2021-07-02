import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/more/event.dart';
import 'package:port/bloc/more/state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> {
  String userName;

  @override
  MoreState get initialState => UserFetchingState();

  @override
  Stream<MoreState> mapEventToState(MoreEvent event) async* {
    if (event is UserFetchEvent) {
      userName = await _getUserNameFromPrefs();
    }
  }

  Future<String> _getUserNameFromPrefs() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print("YOUR PREFERENCES ARE: $_prefs");
  }
}