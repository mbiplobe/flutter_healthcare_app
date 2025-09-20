import 'package:json_annotation/json_annotation.dart';

part 'appointment_db_model.g.dart';

@JsonSerializable()
class AppointmentDbModel {
  final int? id;
  final String patient_uid;
  final String doctor_id;
  final String appointment_date;
  final String appointment_time;
  final String? reason;
  final String? payment_method;
  final String? status;
  final String? created_by;
  final String? created_at;
  final String? updated_by;
  final String? updated_at;

  AppointmentDbModel({
    this.id,
    required this.patient_uid,
    required this.doctor_id,
    required this.appointment_date,
    required this.appointment_time,
    this.reason,
    this.payment_method,
    this.status,
    this.created_by,
    this.created_at,
    this.updated_by,
    this.updated_at,
  });


  factory AppointmentDbModel.fromJson(Map<String, dynamic> json) => _$AppointmentDbModelFromJson(json);
  // Map<String, dynamic> toJson() => _$AppointmentDbModelToJson(this);
  


}
