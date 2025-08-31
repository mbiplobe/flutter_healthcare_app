// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
  id: json['id'] as String,
  name: json['name'] as String?,
  department: json['department'] as String?,
  specialist: json['specialist'] as String?,
  phone: json['phone'] as String?,
  education: json['education'] as String?,
  experience: json['experience'] as String?,
  about: json['about'] as String?,
  fees: json['fees'] as String?,
  joinDate: json['joinDate'] == null
      ? null
      : DateTime.parse(json['joinDate'] as String),
  photo: json['photo'] as String?,
  gender: json['gender'] as String?,
  isActive: json['isActive'] as bool?,
  createdBy: json['createdBy'] as String?,
  createdTime: json['createdTime'] == null
      ? null
      : DateTime.parse(json['createdTime'] as String),
  updatedBy: json['updatedBy'] as String?,
  updatedTime: json['updatedTime'] == null
      ? null
      : DateTime.parse(json['updatedTime'] as String),
  sortBy: (json['sortBy'] as num?)?.toInt(),
  isView: json['isView'] as bool?,
  viewBy: json['viewBy'] as String?,
  viewTime: json['viewTime'] == null
      ? null
      : DateTime.parse(json['viewTime'] as String),
  doctorRating: json['doctorRating'] as String?,
  location: json['location'] as String?,
  latitude: json['latitude'] as String?,
  longitude: json['longitude'] as String?,
  jsonDetails: json['jsonDetails'] as String?,
  queryFlag: json['queryFlag'] as String?,
);

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'department': instance.department,
  'specialist': instance.specialist,
  'phone': instance.phone,
  'education': instance.education,
  'experience': instance.experience,
  'about': instance.about,
  'fees': instance.fees,
  'joinDate': instance.joinDate?.toIso8601String(),
  'photo': instance.photo,
  'gender': instance.gender,
  'isActive': instance.isActive,
  'createdBy': instance.createdBy,
  'createdTime': instance.createdTime?.toIso8601String(),
  'updatedBy': instance.updatedBy,
  'updatedTime': instance.updatedTime?.toIso8601String(),
  'sortBy': instance.sortBy,
  'isView': instance.isView,
  'viewBy': instance.viewBy,
  'viewTime': instance.viewTime?.toIso8601String(),
  'doctorRating': instance.doctorRating,
  'location': instance.location,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'jsonDetails': instance.jsonDetails,
  'queryFlag': instance.queryFlag,
};
