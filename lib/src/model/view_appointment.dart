import 'package:json_annotation/json_annotation.dart';

part 'view_appointment.g.dart';

@JsonSerializable()
class ViewAppointment {
  final String id;
  final String? patientUid;
  final String doctorId;
  final String dates;
  final String? timeId;
  final String reasons;
  final String? payMethod;
  final String status;
  final String? createdBy;
  final String? createdTime;
  final String? updatedBy;
  final String? updatedTime;
  final String doctorName;
  final String speciality;
  final String doctorDept;
  final String appointmentTime;
  final String? queryFlag;

  ViewAppointment({
    required this.id,
    this.patientUid,
    required this.doctorId,
    required this.dates,
    this.timeId,
    required this.reasons,
    this.payMethod,
    required this.status,
    this.createdBy,
    this.createdTime,
    this.updatedBy,
    this.updatedTime,
    required this.doctorName,
    required this.speciality,
    required this.doctorDept,
    required this.appointmentTime,
    this.queryFlag,
  });

  factory ViewAppointment.fromJson(Map<String, dynamic> json) =>
      _$ViewAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$ViewAppointmentToJson(this);
}
