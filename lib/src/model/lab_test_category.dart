import 'package:json_annotation/json_annotation.dart';

part 'lab_test_category.g.dart';

@JsonSerializable()
class LabTestCategory {
  final String id;
  final String catId;
  final String catTestType;
  final String catTestName;
  final String? createdBy;
  final DateTime? createdAt;
  final String? updatedBy;
  final DateTime? updateDate;

  LabTestCategory({
    required this.id,
    required this.catId,
    required this.catTestType,
    required this.catTestName,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updateDate,
  });

  factory LabTestCategory.fromJson(Map<String, dynamic> json) =>
      _$LabTestCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$LabTestCategoryToJson(this);
}
