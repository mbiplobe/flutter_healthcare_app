import 'package:json_annotation/json_annotation.dart';

part 'appointment.g.dart';

@JsonSerializable(explicitToJson: true)
class Appointment {
  final String? patientUid;
  final String? doctorId;
  final String? date;
  final String? timeId;
  final String? reason;
  final String? payment;

  

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Appointment({ this.doctorId,this.patientUid,    this.date,  this.timeId,  this.reason,  this.payment});
  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}
