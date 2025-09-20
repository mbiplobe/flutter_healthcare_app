// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorDbModel _$DoctorDbModelFromJson(Map<String, dynamic> json) =>
    DoctorDbModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      department: json['department'] as String,
      specialist: json['specialist'] as String,
      phone: json['phone'] as String?,
      education: json['education'] as String?,
      experience: json['experience'] as String?,
      about: json['about'] as String?,
      fees: json['fees'] as String,
      join_date: json['join_date'] as String?,
      photo: json['photo'] as String?,
      gender: json['gender'] as String?,
      is_active: json['is_active'] as bool,
      created_by: json['created_by'] as String?,
      created_time: json['created_time'] as String?,
      updated_by: json['updated_by'] as String?,
      updated_time: json['updated_time'] as String?,
      location: json['location'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
    );

Map<String, dynamic> _$DoctorDbModelToJson(DoctorDbModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'department': instance.department,
      'specialist': instance.specialist,
      'phone': instance.phone,
      'education': instance.education,
      'experience': instance.experience,
      'about': instance.about,
      'fees': instance.fees,
      'join_date': instance.join_date,
      'photo': instance.photo,
      'gender': instance.gender,
      'is_active': instance.is_active,
      'created_by': instance.created_by,
      'created_time': instance.created_time,
      'updated_by': instance.updated_by,
      'updated_time': instance.updated_time,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
