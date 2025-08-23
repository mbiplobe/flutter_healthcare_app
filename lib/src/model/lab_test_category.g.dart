// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_test_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabTestCategory _$LabTestCategoryFromJson(Map<String, dynamic> json) =>
    LabTestCategory(
      id: json['id'] as String,
      catId: json['catId'] as String,
      catTestType: json['catTestType'] as String,
      catTestName: json['catTestName'] as String,
      createdBy: json['createdBy'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedBy: json['updatedBy'] as String?,
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
    );

Map<String, dynamic> _$LabTestCategoryToJson(LabTestCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'catId': instance.catId,
      'catTestType': instance.catTestType,
      'catTestName': instance.catTestName,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedBy': instance.updatedBy,
      'updateDate': instance.updateDate?.toIso8601String(),
    };
