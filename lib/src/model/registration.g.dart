// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Registration _$RegistrationFromJson(Map<String, dynamic> json) => Registration(
  username: json['username'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  userEmail: json['userEmail'] as String,
  userPhone: json['userPhone'] as String,
  userPass: json['userPass'] as String,
  address: json['address'] as String,
  gender: json['gender'] as String,
  dob: json['dob'] as String,
  userType: json['userType'] as String,
);

Map<String, dynamic> _$RegistrationToJson(Registration instance) =>
    <String, dynamic>{
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userEmail': instance.userEmail,
      'userPhone': instance.userPhone,
      'userPass': instance.userPass,
      'address': instance.address,
      'gender': instance.gender,
      'dob': instance.dob,
      'userType': instance.userType,
    };
