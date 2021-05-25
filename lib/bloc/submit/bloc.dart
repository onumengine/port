import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port/bloc/submit/event.dart';
import 'package:port/bloc/submit/state.dart';

class SubmitBloc extends Bloc<SubmitScreenEvent, SubmitScreenState> {
  @override
  SubmitScreenState get initialState => DefaultState();

  @override
  Stream<SubmitScreenState> mapEventToState(SubmitScreenEvent event) async* {
    yield SuccessfulSubmissionState();
  }
}
