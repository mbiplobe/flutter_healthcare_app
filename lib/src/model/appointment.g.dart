// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appointment _$AppointmentFromJson(Map<String, dynamic> json) => Appointment(
  doctorId: json['doctorId'] as String?,
  patientUid: json['patientUid'] as String?,
  date: json['date'] as String?,
  timeId: json['timeId'] as String?,
  reason: json['reason'] as String?,
  payment: json['payment'] as String?,
);

Map<String, dynamic> _$AppointmentToJson(Appointment instance) =>
    <String, dynamic>{
      'patientUid': instance.patientUid,
      'doctorId': instance.doctorId,
      'date': instance.date,
      'timeId': instance.timeId,
      'reason': instance.reason,
      'payment': instance.payment,
    };
