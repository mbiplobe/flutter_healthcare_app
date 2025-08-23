import 'package:json_annotation/json_annotation.dart';

part 'available.g.dart'; // 👈 generated file

@JsonSerializable(explicitToJson: true)
class Available {
  final String id;
  final String doctorId;
  final String days;
  final String times;
  final bool? isActive;
  final String? createdBy;
  final DateTime? createdTime;
  final String? updatedBy;
  final DateTime? updatedTime;
  final String? queryFlag;
  final bool getTimeByDay;
  final List<Available> timeList;

  Available({
    required this.id,
    required this.doctorId,
    required this.days,
    required this.times,
    this.isActive,
    this.createdBy,
    this.createdTime,
    this.updatedBy,
    this.updatedTime,
    this.queryFlag,
    this.getTimeByDay = false,
    this.timeList = const [],
  });

  /// 🔹 JSON → Model
  factory Available.fromJson(Map<String, dynamic> json) =>
      _$AvailableFromJson(json);

  /// 🔹 Model → JSON
  Map<String, dynamic> toJson() => _$AvailableToJson(this);
}
