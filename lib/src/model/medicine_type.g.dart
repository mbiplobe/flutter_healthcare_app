// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineType _$MedicineTypeFromJson(Map<String, dynamic> json) => MedicineType(
  id: json['id'] as String,
  medicineTypeName: json['medicineTypeName'] as String,
  imageUrl: json['imageUrl'] as String,
  status: json['status'] as String,
);

Map<String, dynamic> _$MedicineTypeToJson(MedicineType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'medicineTypeName': instance.medicineTypeName,
      'imageUrl': instance.imageUrl,
      'status': instance.status,
    };
