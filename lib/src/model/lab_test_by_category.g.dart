// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_test_by_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabTestByCategory _$LabTestByCategoryFromJson(Map<String, dynamic> json) =>
    LabTestByCategory(
      id: json['id'] as String,
      testId: json['testId'] as String,
      testName: json['testName'] as String,
      testAmount: json['testAmount'] as String,
      testStatus: json['testStatus'] as bool?,
      testCategory: json['testCategory'] as String,
      createdBy: json['createdBy'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedBy: json['updatedBy'] as String?,
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
      catTestName: json['catTestName'] as String,
    );

Map<String, dynamic> _$LabTestByCategoryToJson(LabTestByCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'testId': instance.testId,
      'testName': instance.testName,
      'testAmount': instance.testAmount,
      'testStatus': instance.testStatus,
      'testCategory': instance.testCategory,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedBy': instance.updatedBy,
      'updateDate': instance.updateDate?.toIso8601String(),
      'catTestName': instance.catTestName,
    };
