
import 'package:json_annotation/json_annotation.dart';

part 'doctor.g.dart';

@JsonSerializable()
class Doctor {
  final String id;
  final String name;
  final String department;
  final String specialist;
  final String phone;
  final String education;
  final String? experience;
  final String about;
  final String fees;
  final DateTime? joinDate;
  final String photo;
  final String? gender;
  final bool? isActive;
  final String? createdBy;
  final DateTime? createdTime;
  final String? updatedBy;
  final DateTime? updatedTime;
  final int? sortBy;
  final bool? isView;
  final String? viewBy;
  final DateTime? viewTime;
  final String doctorRating;
  final String location;
  final String latitude;
  final String longitude;
  final String? jsonDetails;
  final String? queryFlag;

  Doctor({
    required this.id,
    required this.name,
    required this.department,
    required this.specialist,
    required this.phone,
    required this.education,
    this.experience,
    required this.about,
    required this.fees,
    this.joinDate,
    required this.photo,
    this.gender,
    this.isActive,
    this.createdBy,
    this.createdTime,
    this.updatedBy,
    this.updatedTime,
    this.sortBy,
    this.isView,
    this.viewBy,
    this.viewTime,
    required this.doctorRating,
    required this.location,
    required this.latitude,
    required this.longitude,
    this.jsonDetails,
    this.queryFlag,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}
