import 'package:port/model/';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class CreateStudentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchEvent extends CreateStudentEvent {
  String lid;
  FetchEvent({@required this.lid});
  @override
  List<Object> get props => [];
}


class PostEvent extends CreateStudentEvent {
  Student student;
  PostEvent({@required this.student});
  @override
  List<Object> get props => [];
}
