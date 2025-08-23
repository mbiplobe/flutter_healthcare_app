import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String id;
  final String? logname;
  final String logpass;
  final String? securPass;
  final String email;
  final String firstName;
  final String lastName;
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

  LoginResponse({
    required this.id,
    this.logname,
    required this.logpass,
    this.securPass,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.username,
    this.userphone,
    this.gender,
    this.userdob,
    this.address,
    required this.usertype,
    this.userid,
    this.roleid,
    this.isActive,
    this.createdBy,
    this.createdTime,
    this.updatedBy,
    this.updatedTime,
    this.lastLogin,
    this.queryFlag,
    this.confirmPass,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
