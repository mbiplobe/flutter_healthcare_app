// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  icon: json['icon'],
  type: json['type'],
  isActive: json['isActive'],
  createdBy: json['createdBy'],
  createdTime: json['createdTime'],
  updatedBy: json['updatedBy'],
  updatedTime: json['updatedTime'],
  sortBy: json['sortBy'],
  isView: json['isView'],
  viewBy: json['viewBy'],
  viewTime: json['viewTime'],
  jsonDetails: json['jsonDetails'],
  queryFlag: json['queryFlag'],
);

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'icon': instance.icon,
  'type': instance.type,
  'isActive': instance.isActive,
  'createdBy': instance.createdBy,
  'createdTime': instance.createdTime,
  'updatedBy': instance.updatedBy,
  'updatedTime': instance.updatedTime,
  'sortBy': instance.sortBy,
  'isView': instance.isView,
  'viewBy': instance.viewBy,
  'viewTime': instance.viewTime,
  'jsonDetails': instance.jsonDetails,
  'queryFlag': instance.queryFlag,
};
