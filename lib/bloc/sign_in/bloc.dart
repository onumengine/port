import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:port/model/login_response.dart';
import 'package:port/repository/api_client.dart';
import 'package:port/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  UserRepository userRepository;
  ApiClient _apiClient = ApiClient();

  SignInBloc({@required this.userRepository});

  @override
  SignInState get initialState => SignInInitialState();

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SigningInEvent) {
      yield SignInPostingState();
      if (event.password == null || event.email == null) {
        yield SignInPostingError(error: "please fill all fields");
        yield SignInInitialState();
      } else if (event.password.isEmpty || event.email.isEmpty) {
        yield SignInPostingError(error: "please fill all fields");
        yield SignInInitialState();
      } else {
        try {
          LoginResponse response = await userRepository
              .signInWithEmailAndPassword(event.email, event.password);
          if (response.error == true) {
            yield SignInPostingError(error: response.message);
          } else {
            userRepository.loginUser(response.account);
            yield SignInPostedSuccess(message: "Welcome to SSHub");
          }
        } catch (e) {
          yield SignInPostingError(error: e.toString());
        }
      }
    }
  }
}
