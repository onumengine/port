import "package:flutter/material.dart";

class Appointment {
  String date;
  String time;
  int duration;
  String purposeId;
  String repId; // This is the id of the organization's user that was chosen
  String note;
  String userId;

  Appointment({
    @required this.date,
    @required this.time,
    @required this.duration,
    @required this.purposeId,
    @required this.repId,
    @required this.note,
    @required this.userId,
  });

  Appointment.fromJson(Map<String, dynamic> jsonMap) {
    this.date = jsonMap["date"];
    this.time = jsonMap["time"];
    this.duration = jsonMap["duration"];
    this.purposeId = jsonMap["purposeId"];
    this.repId = jsonMap["repId"];
    this.note = jsonMap["note"];
    this.userId = jsonMap["userId"];
  }

  Map<String, dynamic> convertToMap() {
    return <String, dynamic>{
      "date": this.date,
      "time": this.time,
      "duration": this.duration,
      "purposeId" : this.purposeId,
      "repId": this.repId,
      "note": this.note,
      "userId": this.userId,
    };
  }
}
