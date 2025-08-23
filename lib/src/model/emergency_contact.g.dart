// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Emergency _$EmergencyFromJson(Map<String, dynamic> json) => Emergency(
  userid: json['userid'] as String,
  address: json['address'] as String,
  userphone: json['userphone'] as String,
  postcode: json['postcode'] as String,
  createdBy: json['createdBy'] as String,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  emergencyList:
      (json['emergencyList'] as List<dynamic>?)
          ?.map((e) => EmergencyContactList.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$EmergencyToJson(Emergency instance) => <String, dynamic>{
  'userid': instance.userid,
  'address': instance.address,
  'userphone': instance.userphone,
  'postcode': instance.postcode,
  'createdBy': instance.createdBy,
  'createdAt': instance.createdAt?.toIso8601String(),
  'emergencyList': instance.emergencyList.map((e) => e.toJson()).toList(),
};

EmergencyContactList _$EmergencyContactListFromJson(
  Map<String, dynamic> json,
) => EmergencyContactList(
  emergencyContactPerson: json['emergencyContactPerson'] as String,
  emergencyContactPhone: json['emergencyContactPhone'] as String,
);

Map<String, dynamic> _$EmergencyContactListToJson(
  EmergencyContactList instance,
) => <String, dynamic>{
  'emergencyContactPerson': instance.emergencyContactPerson,
  'emergencyContactPhone': instance.emergencyContactPhone,
};
