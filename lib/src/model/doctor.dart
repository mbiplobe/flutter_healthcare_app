
import 'package:json_annotation/json_annotation.dart';

part 'doctor.g.dart';

@JsonSerializable()
class Doctor {
  final String id;
  final String? name;
  final String? department;
  final String? specialist;
  final String? phone;
  final String? education;
  final String? experience;
  final String? about;
  final String? fees;
  final DateTime? joinDate;
  final String? photo;
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
  final String? doctorRating;
  final String? location;
  final String? latitude;
  final String? longitude;
  final String? jsonDetails;
  final String? queryFlag;

  

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  Doctor({required this.id,  this.name,  this.department,  this.specialist,  this.phone,  this.education,  this.experience,  this.about,  this.fees,  this.joinDate,  this.photo,  this.gender,  this.isActive,  this.createdBy,  this.createdTime,  this.updatedBy,  this.updatedTime,  this.sortBy,  this.isView,  this.viewBy,  this.viewTime,  this.doctorRating,  this.location,  this.latitude,  this.longitude,  this.jsonDetails,  this.queryFlag});
  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}
