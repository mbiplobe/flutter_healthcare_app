// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationResponse _$RegistrationResponseFromJson(
  Map<String, dynamic> json,
) => RegistrationResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  id: json['id'] as String,
);

Map<String, dynamic> _$RegistrationResponseToJson(
  RegistrationResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'id': instance.id,
};
