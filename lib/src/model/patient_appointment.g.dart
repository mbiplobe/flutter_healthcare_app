// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientAppointment _$PatientAppointmentFromJson(Map<String, dynamic> json) =>
    PatientAppointment(
      id: json['id'] as String,
      patientUid: json['patientUid'] as String,
      patientName: json['patientName'] as String,
      doctorId: json['doctorId'] as String,
      dates: json['dates'] as String,
      timeId: json['timeId'] as String,
      reasons: json['reasons'] as String,
      payMethod: json['payMethod'] as String?,
      status: json['status'] as String,
      createdBy: json['createdBy'] as String?,
      createdTime: json['createdTime'] as String,
      updatedBy: json['updatedBy'] as String?,
      updatedTime: json['updatedTime'] as String?,
      doctorName: json['doctorName'] as String,
      speciality: json['speciality'] as String,
      doctorDept: json['doctorDept'] as String,
      appointmentTime: json['appointmentTime'] as String,
      gender: json['gender'] as String,
      age: json['age'] as String,
      queryFlag: json['queryFlag'] as String,
    );

Map<String, dynamic> _$PatientAppointmentToJson(PatientAppointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patientUid': instance.patientUid,
      'patientName': instance.patientName,
      'doctorId': instance.doctorId,
      'dates': instance.dates,
      'timeId': instance.timeId,
      'reasons': instance.reasons,
      'payMethod': instance.payMethod,
      'status': instance.status,
      'createdBy': instance.createdBy,
      'createdTime': instance.createdTime,
      'updatedBy': instance.updatedBy,
      'updatedTime': instance.updatedTime,
      'doctorName': instance.doctorName,
      'speciality': instance.speciality,
      'doctorDept': instance.doctorDept,
      'appointmentTime': instance.appointmentTime,
      'gender': instance.gender,
      'age': instance.age,
      'queryFlag': instance.queryFlag,
    };
