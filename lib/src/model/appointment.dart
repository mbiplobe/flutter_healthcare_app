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
  final String? createdBy;
  final String? createdAt;
  final String? status;
  final String? appointmentId;
  final String? updatedBy;
  final String? UpdatedAt;

  Appointment({
    this.patientUid,
    this.doctorId,
    this.date,
    this.timeId,
    this.reason = '',
    this.payment = '',
    this.createdBy,
    this.createdAt,
    this.status,
    this.appointmentId,
    this.updatedBy,
    this.UpdatedAt,
  });
  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentToJson(this);
}
