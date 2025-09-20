// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentDbModel _$AppointmentDbModelFromJson(Map<String, dynamic> json) =>
    AppointmentDbModel(
      id: (json['id'] as num?)?.toInt(),
      patient_uid: json['patient_uid'] as String,
      doctor_id: json['doctor_id'] as String,
      appointment_date: json['appointment_date'] as String,
      appointment_time: json['appointment_time'] as String,
      reason: json['reason'] as String?,
      payment_method: json['payment_method'] as String?,
      status: json['status'] as String?,
      created_by: json['created_by'] as String?,
      created_at: json['created_at'] as String?,
      updated_by: json['updated_by'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$AppointmentDbModelToJson(AppointmentDbModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patient_uid': instance.patient_uid,
      'doctor_id': instance.doctor_id,
      'appointment_date': instance.appointment_date,
      'appointment_time': instance.appointment_time,
      'reason': instance.reason,
      'payment_method': instance.payment_method,
      'status': instance.status,
      'created_by': instance.created_by,
      'created_at': instance.created_at,
      'updated_by': instance.updated_by,
      'updated_at': instance.updated_at,
    };
