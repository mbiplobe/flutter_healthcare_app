// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      id: json['id'] as String,
      logname: json['logname'] as String?,
      logpass: json['logpass'] as String,
      securPass: json['securPass'] as String?,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      username: json['username'] as String?,
      userphone: json['userphone'] as String?,
      gender: json['gender'] as String?,
      userdob: json['userdob'] as String?,
      address: json['address'] as String?,
      usertype: json['usertype'] as String,
      userid: json['userid'] as String?,
      roleid: json['roleid'] as String?,
      isActive: json['isActive'] as bool?,
      createdBy: json['createdBy'] as String?,
      createdTime: json['createdTime'] == null
          ? null
          : DateTime.parse(json['createdTime'] as String),
      updatedBy: json['updatedBy'] as String?,
      updatedTime: json['updatedTime'] == null
          ? null
          : DateTime.parse(json['updatedTime'] as String),
      lastLogin: json['lastLogin'] == null
          ? null
          : DateTime.parse(json['lastLogin'] as String),
      queryFlag: json['queryFlag'] as String?,
      confirmPass: json['confirmPass'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logname': instance.logname,
      'logpass': instance.logpass,
      'securPass': instance.securPass,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'userphone': instance.userphone,
      'gender': instance.gender,
      'userdob': instance.userdob,
      'address': instance.address,
      'usertype': instance.usertype,
      'userid': instance.userid,
      'roleid': instance.roleid,
      'isActive': instance.isActive,
      'createdBy': instance.createdBy,
      'createdTime': instance.createdTime?.toIso8601String(),
      'updatedBy': instance.updatedBy,
      'updatedTime': instance.updatedTime?.toIso8601String(),
      'lastLogin': instance.lastLogin?.toIso8601String(),
      'queryFlag': instance.queryFlag,
      'confirmPass': instance.confirmPass,
    };
