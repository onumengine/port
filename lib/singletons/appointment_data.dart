import 'package:equatable/equatable.dart';

class AppointmentData extends Equatable {
  String date;
  String time;
  String durationInMinutes;
  String purposeId;
  String repId;
  String note;
  String userId;

  List<Object> get props => [
        this.date,
        this.time,
        this.durationInMinutes,
        this.purposeId,
        this.repId,
        this.note,
        this.userId,
      ];

  void resetProps() {
    this.props.forEach((element) {
      element = "";
    });
  }
}
