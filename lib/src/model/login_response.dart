import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final int id;
  final String? logname;
  final String? logpass;
  final String? securPass;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? userphone;
  final String? gender;
  final String? userdob;
  final String? address;
  final String usertype;
  final String? userid;
  final String? roleid;
  final bool? isActive;
  final String? createdBy;
  final DateTime? createdTime;
  final String? updatedBy;
  final DateTime? updatedTime;
  final DateTime? lastLogin;
  final String? queryFlag;
  final String? confirmPass;
  final bool? success;
  final String? message;

  

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  LoginResponse({required this.id, required this.logname, required this.logpass, required this.securPass, required this.email, required this.firstName, required this.lastName, required this.username, required this.userphone, required this.gender, required this.userdob, required this.address, required this.usertype, required this.userid, required this.roleid, required this.isActive, required this.createdBy, required this.createdTime, required this.updatedBy, required this.updatedTime, required this.lastLogin, required this.queryFlag, required this.confirmPass, required this.success, required this.message});

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
