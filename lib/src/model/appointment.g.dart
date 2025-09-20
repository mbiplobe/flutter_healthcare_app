// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
  patientUid: json['patientUid'] as String?,
  doctorId: json['doctorId'] as String?,
  date: json['date'] as String?,
  timeId: json['timeId'] as String?,
  reason: json['reason'] as String? ?? '',
  payment: json['payment'] as String? ?? '',
  createdBy: json['createdBy'] as String?,
  createdAt: json['createdAt'] as String?,
  status: json['status'] as String?,
  appointmentId: json['appointmentId'] as String?,
  updatedBy: json['updatedBy'] as String?,
  UpdatedAt: json['UpdatedAt'] as String?,
);

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'patientUid': instance.patientUid,
      'doctorId': instance.doctorId,
      'date': instance.date,
      'timeId': instance.timeId,
      'reason': instance.reason,
      'payment': instance.payment,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt,
      'status': instance.status,
      'appointmentId': instance.appointmentId,
      'updatedBy': instance.updatedBy,
      'UpdatedAt': instance.UpdatedAt,
    };
