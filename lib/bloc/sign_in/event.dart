import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SignInEvent extends Equatable {
  @override
  List<Object> get props => [];
}

//class FetchCommentEvent extends SignInEvent {
//  String postId;
//  FetchCommentEvent({@required this.postId});
//  @override
//  List<Object> get props => [];
//}


//postComment evennt
class SigningInEvent extends SignInEvent {

  String email;
  String password;
  SigningInEvent({  this.email,  this.password});
  @override
  List<Object> get props => [];
}
