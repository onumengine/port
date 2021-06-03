import 'package:equatable/equatable.dart';

abstract class SubmitScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SubmissionEvent extends SubmitScreenEvent {
  String date;
  String time;
  int duration;
  String purposeId;
  String repId;
  String note;
  String userId;

  SubmissionEvent({
    this.date,
    this.time,
    this.duration,
    this.purposeId,
    this.repId,
    this.note,
    this.userId,
  });

  @override
  List<Object> get props => [
        this.date,
        this.time,
        this.duration,
        this.purposeId,
        this.repId,
        this.note,
        this.userId,
      ];
}
