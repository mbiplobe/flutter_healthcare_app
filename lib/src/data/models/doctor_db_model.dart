import 'package:json_annotation/json_annotation.dart';

part 'doctor_db_model.g.dart';

@JsonSerializable()
class DoctorDbModel {
  final int id;
  final String name;
  final String department;
  final String specialist;
  final String? phone;
  final String? education;
  final String? experience;
  final String? about;
  final String fees;
  final String? join_date;
  final String? photo;
  final String? gender;
  final bool is_active;
  final String? created_by;
  final String? created_time;
  final String? updated_by;
  final String? updated_time; // <- changed to snake_case for consistency
  final String? location;
  final String? latitude;
  final String? longitude;

  DoctorDbModel({
    required this.id,
    required this.name,
    required this.department,
    required this.specialist,
    this.phone,
    this.education,
    this.experience,
    this.about,
    required this.fees,
    this.join_date,
    this.photo,
    this.gender,
    required this.is_active,
    this.created_by,
    this.created_time,
    this.updated_by,
    this.updated_time,
    this.location,
    this.latitude,
    this.longitude,
  });

  factory DoctorDbModel.fromJson(Map<String, dynamic> json) =>_$DoctorDbModelFromJson(json);

}
