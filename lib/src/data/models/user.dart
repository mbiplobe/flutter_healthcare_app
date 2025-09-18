

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User 
{
  final int id;
  final String? first_name;
  final String? last_name;
  final String? email;
  final String? user_phone;
  final String? userPass;
  final String? address;
  final String? gender;
  final String? password;
    final String user_type;
User({
    required this.id,
    this.first_name,
    this.last_name,
    this.email,
    this.user_phone,
    this.userPass,
    this.address,
    this.gender,
    this.password,
    required this.user_type,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  

}