// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lab_test_by_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabTestByUser _$LabTestByUserFromJson(Map<String, dynamic> json) =>
    LabTestByUser(
      id: json['id'] as String,
      testId: json['testId'] as String,
      testName: json['testName'] as String,
      testCatId: json['testCatId'] as String,
      catTestName: json['catTestName'] as String,
      createdBy: json['createdBy'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedBy: json['updatedBy'] as String?,
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
      testAmount: json['testAmount'] as String,
      testFor: json['testFor'] as String,
      sampleCollectDate: json['sampleCollectDate'] as String,
      sampleCollectTime: json['sampleCollectTime'] as String,
      paymentType: json['paymentType'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$LabTestByUserToJson(LabTestByUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'testId': instance.testId,
      'testName': instance.testName,
      'testCatId': instance.testCatId,
      'catTestName': instance.catTestName,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedBy': instance.updatedBy,
      'updateDate': instance.updateDate?.toIso8601String(),
      'testAmount': instance.testAmount,
      'testFor': instance.testFor,
      'sampleCollectDate': instance.sampleCollectDate,
      'sampleCollectTime': instance.sampleCollectTime,
      'paymentType': instance.paymentType,
      'status': instance.status,
    };
