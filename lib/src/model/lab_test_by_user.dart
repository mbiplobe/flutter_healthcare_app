import 'package:json_annotation/json_annotation.dart';

part 'lab_test_by_user.g.dart';

@JsonSerializable()
class LabTestByUser {
  final String id;
  final String testId;
  final String testName;
  final String testCatId;
  final String catTestName;
  final String? createdBy;
  final DateTime? createdAt;
  final String? updatedBy;
  final DateTime? updateDate;
  final String testAmount;
  final String testFor;
  final String sampleCollectDate;
  final String sampleCollectTime;
  final String paymentType;
  final String status;

  LabTestByUser({
    required this.id,
    required this.testId,
    required this.testName,
    required this.testCatId,
    required this.catTestName,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updateDate,
    required this.testAmount,
    required this.testFor,
    required this.sampleCollectDate,
    required this.sampleCollectTime,
    required this.paymentType,
    required this.status,
  });

  factory LabTestByUser.fromJson(Map<String, dynamic> json) =>
      _$LabTestByUserFromJson(json);

  Map<String, dynamic> toJson() => _$LabTestByUserToJson(this);
}
