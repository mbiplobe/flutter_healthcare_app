// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Available _$AvailableFromJson(Map<String, dynamic> json) => Available(
  id: json['id'] as String,
  doctorId: json['doctorId'] as String,
  days: json['days'] as String,
  times: json['times'] as String,
  isActive: json['isActive'] as bool?,
  createdBy: json['createdBy'] as String?,
  createdTime: json['createdTime'] == null
      ? null
      : DateTime.parse(json['createdTime'] as String),
  updatedBy: json['updatedBy'] as String?,
  updatedTime: json['updatedTime'] == null
      ? null
      : DateTime.parse(json['updatedTime'] as String),
  queryFlag: json['queryFlag'] as String?,
  getTimeByDay: json['getTimeByDay'] as bool? ?? false,
  timeList:
      (json['timeList'] as List<dynamic>?)
          ?.map((e) => Available.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$AvailableToJson(Available instance) => <String, dynamic>{
  'id': instance.id,
  'doctorId': instance.doctorId,
  'days': instance.days,
  'times': instance.times,
  'isActive': instance.isActive,
  'createdBy': instance.createdBy,
  'createdTime': instance.createdTime?.toIso8601String(),
  'updatedBy': instance.updatedBy,
  'updatedTime': instance.updatedTime?.toIso8601String(),
  'queryFlag': instance.queryFlag,
  'getTimeByDay': instance.getTimeByDay,
  'timeList': instance.timeList.map((e) => e.toJson()).toList(),
};
