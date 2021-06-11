import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/submit/event.dart';
import 'package:port/bloc/submit/state.dart';
import 'package:port/repository/api_client.dart';
import 'package:port/utility/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubmitBloc extends Bloc<SubmitScreenEvent, SubmitScreenState> {
  ApiClient _apiClient = ApiClient();
  Map<String, dynamic> response;
  List arrayOfPurposes;
  String date, time, duration, selectedPurpose, repId;
  var user;
  SharedPreferences _preferences;

  @override
  SubmitScreenState get initialState => InitialSubmitScreenState();

  @override
  Stream<SubmitScreenState> mapEventToState(SubmitScreenEvent event) async* {
    if (event is SubmissionEvent) {
      try {
        await _postSchedule(
          date: date,
          time: time,
          duration: duration,
          purposeId: selectedPurpose,
          repId: repId,
          note: event.note,
          userId: user["id"].toString(),
        );
        yield SuccessfulSubmissionState();
      } catch (e) {
        print("THE FOLLOWING ERROR HAS BEEN THROWN: $e");
        yield SubmissionErrorState(errorMessage: e.toString());
      }
    } else if (event is FetchPreferencesDataEvent) {
      await _initStateFromPrefs();
    } else if (event is PurposesFetchEvent) {
      try {
        await _fetchPurposes();
        _initArrayOfPurposes();
        yield DefaultState(
          purposes: arrayOfPurposes,
          date: date,
          time: time,
          duration: duration,
        );
      } catch (e) {
        print("PURPOSES FETCH ENDED WITH AN ERROR: $e");
      }
    } else if (event is PurposeSelectionEvent) {
      selectedPurpose = event.selectedPurpose;
      yield DefaultState(
        purposes: arrayOfPurposes,
        selectedPurpose: selectedPurpose,
        date: date,
        time: time,
        duration: duration,
      );
    }
  }

  _fetchPurposes() async {
    response = jsonDecode(await _apiClient.get(PURPOSES_FETCH_PATH));
  }

  _initArrayOfPurposes() {
    arrayOfPurposes = response["data"];
    arrayOfPurposes = (arrayOfPurposes.map((e) => e["purpose"])).toList();
  }

  _postSchedule({
    @required String date,
    @required String time,
    @required String duration,
    @required String purposeId,
    @required String repId,
    @required String note,
    @required String userId,
  }) async {
    await _apiClient.postForm(
      SCHEDULE_POST_PATH,
      {
        "note": note,
        "date": date,
        "time": time,
        "duration": duration,
        "purposeId": purposeId,
        "repId": repId,
        "userId": userId,
      },
    );
  }

  Future<void> _initStateFromPrefs() async {
    print("YOUR PREFERENCES ARE CURRENTLY UNFETCHED");
    _preferences = await SharedPreferences.getInstance();
    print("THE KEYS IN YOUR PREFERENCES ARE: ${_preferences.getKeys()}");
    date = _preferences.getString("date");
    time = _preferences.getString("time");
    duration = _preferences.getString("duration");
    repId = _preferences.getString("repId");
    user = _preferences.get("user");
    print(
        "THE SHARED PREFERENCES YOU FETCHED ARE: \n DATE: $date \n TIME: $time \n DURATION: $duration");
    print("THE USER THAT YOU SAVED TO PREFERENCES IS: ${user["id"]}");
  }
}
