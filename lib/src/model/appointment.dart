import 'package:json_annotation/json_annotation.dart';

part 'appointment.g.dart';

@JsonSerializable(explicitToJson: true)
class Appointment {
  final String patientUid;
  final String doctorId;
  final String date;
  final String timeId;
  final String reason;
  final String payment;

  Appointment({
    required this.patientUid,
    required this.doctorId,
    required this.date,
    required this.timeId,
    required this.reason,
    required this.payment,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}
