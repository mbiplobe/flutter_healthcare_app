import 'package:json_annotation/json_annotation.dart';

part 'patient_appointment.g.dart';

@JsonSerializable()
class PatientAppointment {
  final String id;
  final String patientUid;
  final String patientName;
  final String doctorId;
  final String dates;
  final String timeId;
  final String reasons;
  final String? payMethod;
  final String status;
  final String? createdBy;
  final String createdTime;
  final String? updatedBy;
  final String? updatedTime;
  final String doctorName;
  final String speciality;
  final String doctorDept;
  final String appointmentTime;
  final String gender;
  final String age;
  final String queryFlag;

  PatientAppointment({
    required this.id,
    required this.patientUid,
    required this.patientName,
    required this.doctorId,
    required this.dates,
    required this.timeId,
    required this.reasons,
    this.payMethod,
    required this.status,
    this.createdBy,
    required this.createdTime,
    this.updatedBy,
    this.updatedTime,
    required this.doctorName,
    required this.speciality,
    required this.doctorDept,
    required this.appointmentTime,
    required this.gender,
    required this.age,
    required this.queryFlag,
  });

  factory PatientAppointment.fromJson(Map<String, dynamic> json) =>
      _$PatientAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAppointmentToJson(this);
}
