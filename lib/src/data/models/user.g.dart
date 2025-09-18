// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num).toInt(),
  first_name: json['first_name'] as String?,
  last_name: json['last_name'] as String?,
  email: json['email'] as String?,
  user_phone: json['user_phone'] as String?,
  userPass: json['userPass'] as String?,
  address: json['address'] as String?,
  gender: json['gender'] as String?,
  password: json['password'] as String?,
  user_type: json['user_type'] as String,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.first_name,
  'last_name': instance.last_name,
  'email': instance.email,
  'user_phone': instance.user_phone,
  'userPass': instance.userPass,
  'address': instance.address,
  'gender': instance.gender,
  'password': instance.password,
  'user_type': instance.user_type,
};
