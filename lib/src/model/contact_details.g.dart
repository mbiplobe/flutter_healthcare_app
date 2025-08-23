// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactDetails _$ContactDetailsFromJson(Map<String, dynamic> json) =>
    ContactDetails(
      userid: json['userid'] as String,
      address: json['address'] as String,
      userphone: json['userphone'] as String,
      postcode: json['postcode'] as String,
      createdBy: json['createdBy'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updateBy: json['updateBy'] as String?,
      updateAt: json['updateAt'] == null
          ? null
          : DateTime.parse(json['updateAt'] as String),
      id: json['id'] as String?,
      emergencyContactPerson: json['emergencyContactPerson'] as String?,
      emergencyContactPhone: json['emergencyContactPhone'] as String?,
      emergencyList:
          (json['emergencyList'] as List<dynamic>?)
              ?.map((e) => EmergencyList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ContactDetailsToJson(ContactDetails instance) =>
    <String, dynamic>{
      'userid': instance.userid,
      'address': instance.address,
      'userphone': instance.userphone,
      'postcode': instance.postcode,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updateBy': instance.updateBy,
      'updateAt': instance.updateAt?.toIso8601String(),
      'id': instance.id,
      'emergencyContactPerson': instance.emergencyContactPerson,
      'emergencyContactPhone': instance.emergencyContactPhone,
      'emergencyList': instance.emergencyList.map((e) => e.toJson()).toList(),
    };

EmergencyList _$EmergencyListFromJson(Map<String, dynamic> json) =>
    EmergencyList(
      emergencyContactPerson: json['emergencyContactPerson'] as String,
      emergencyContactPhone: json['emergencyContactPhone'] as String,
    );

Map<String, dynamic> _$EmergencyListToJson(EmergencyList instance) =>
    <String, dynamic>{
      'emergencyContactPerson': instance.emergencyContactPerson,
      'emergencyContactPhone': instance.emergencyContactPhone,
    };
