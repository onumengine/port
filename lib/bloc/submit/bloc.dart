import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/submit/event.dart';
import 'package:port/bloc/submit/state.dart';
import 'package:port/repository/api_client.dart';
import 'package:port/utility/constants.dart';

class SubmitBloc extends Bloc<SubmitScreenEvent, SubmitScreenState> {
  ApiClient _apiClient = ApiClient();
  Map<String, dynamic> response;
  List arrayOfPurposes;
  String date, time, duration;

  @override
  SubmitScreenState get initialState => DefaultState(
        purposes: [
          "purpose 1",
          "purpose 2",
          "purpose 3",
        ],
      );

  @override
  Stream<SubmitScreenState> mapEventToState(SubmitScreenEvent event) async* {
    if (event is SubmissionEvent) {
      try {
        await _postSchedule(note: event.note);
      } catch (e) {
        print("THE FOLLOWING ERROR HAS BEEN THROWN: $e");
      } finally {
        yield SuccessfulSubmissionState();
      }
    } else if (event is PurposesFetchEvent) {
      try {
        await _fetchPurposes();
        yield DefaultState(
          purposes: arrayOfPurposes,
        );
      } catch (e) {
        print("PURPOSES FETCH ENDED WITH AN ERROR: $e");
      }
    } else if (event is PurposeSelectionEvent) {
      yield DefaultState(
        purposes: arrayOfPurposes,
        selectedPurpose: event.selectedPurpose,
      );
    }
  }

  _postSchedule({String note}) async {
    await _apiClient.postForm(
      SCHEDULE_POST_PATH,
      {
        "note": note,
      },
    );
  }

  _fetchPurposes() async {
    response = jsonDecode(await _apiClient.get(PURPOSES_FETCH_PATH));
    arrayOfPurposes = response["data"];
    arrayOfPurposes = (arrayOfPurposes.map((e) => e["purpose"])).toList();
  }
}
