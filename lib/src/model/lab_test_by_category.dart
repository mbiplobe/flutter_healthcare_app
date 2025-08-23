import 'package:json_annotation/json_annotation.dart';

part 'lab_test_by_category.g.dart';

@JsonSerializable()
class LabTestByCategory {
  final String id;
  final String testId;
  final String testName;
  final String testAmount;
  final bool? testStatus;
  final String testCategory;
  final String? createdBy;
  final DateTime? createdAt;
  final String? updatedBy;
  final DateTime? updateDate;
  final String catTestName;

  LabTestByCategory({
    required this.id,
    required this.testId,
    required this.testName,
    required this.testAmount,
    this.testStatus,
    required this.testCategory,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updateDate,
    required this.catTestName,
  });

  factory LabTestByCategory.fromJson(Map<String, dynamic> json) =>
      _$LabTestByCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$LabTestByCategoryToJson(this);
}
