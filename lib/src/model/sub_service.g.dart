// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubService _$SubServiceFromJson(Map<String, dynamic> json) => SubService(
  id: json['id'] as String,
  serviceCenterName: json['serviceCenterName'] as String,
  serviceCenterAddress: json['serviceCenterAddress'] as String,
  latitude: json['latitude'] as String,
  longitude: json['longitude'] as String,
  phone: json['phone'] as String,
  email: json['email'] as String,
  ownerName: json['ownerName'] as String,
  status: json['status'],
  createdBy: json['createdBy'],
  createdAt: json['createdAt'],
  serviceType: json['serviceType'] as String,
  serviceTypeName: json['serviceTypeName'] as String,
  serviceTags: json['serviceTags'] as String,
  queryFlag: json['queryFlag'],
);

Map<String, dynamic> _$SubServiceToJson(SubService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'serviceCenterName': instance.serviceCenterName,
      'serviceCenterAddress': instance.serviceCenterAddress,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'phone': instance.phone,
      'email': instance.email,
      'ownerName': instance.ownerName,
      'status': instance.status,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt,
      'serviceType': instance.serviceType,
      'serviceTypeName': instance.serviceTypeName,
      'serviceTags': instance.serviceTags,
      'queryFlag': instance.queryFlag,
    };
