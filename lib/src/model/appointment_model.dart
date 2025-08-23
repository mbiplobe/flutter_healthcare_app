import 'package:json_annotation/json_annotation.dart';

part 'appointment_model.g.dart';

@JsonSerializable()
class AppointmentModel {
  final String name;
  final String date;      
  final String time;      
  final int age;          
  final String gender;
  final String appointmentId;
  final String reason;

  AppointmentModel({
    required this.name,
    required this.date,
    required this.time,
    required this.age,
    required this.gender,
    required this.appointmentId,
    required this.reason,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) => _$AppointmentModelFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);
}
