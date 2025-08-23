// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      name: json['name'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      age: (json['age'] as num).toInt(),
      gender: json['gender'] as String,
      appointmentId: json['appointmentId'] as String,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date,
      'time': instance.time,
      'age': instance.age,
      'gender': instance.gender,
      'appointmentId': instance.appointmentId,
      'reason': instance.reason,
    };
