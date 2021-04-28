import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:port/model/generic_response.dart';
import 'package:port/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'event.dart';
import 'state.dart';

class CreateStudentBloc extends Bloc<CreateStudentEvent,CreateStudentState>{
  UserRepository repository;

CreateStudentBloc({@required this.repository});

@override
CreateStudentState get initialState => InitialState();

@override
Stream<CreateStudentState> mapEventToState(CreateStudentEvent event) async* {
  if (event is PostEvent) {
    yield PostingState();
    try{
      GenericResponse response = await repository.createStudent(event.student);
      if(response.error==false){
        yield PostedSuccess();
      }else
        {
          yield PostingError(error: response.message);

        }
    }catch(e){
      yield PostingError(error: e.toString());
    }
  }
}

}