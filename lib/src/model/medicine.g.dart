// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medicine _$MedicineFromJson(Map<String, dynamic> json) => Medicine(
  id: json['id'] as String,
  medicineName: json['medicineName'] as String,
  medicineCompany: json['medicineCompany'] as String,
  medicineType: json['medicineType'] as String,
  medicineTypeName: json['medicineTypeName'] as String,
  productCategory: json['productCategory'] as String,
  productCategoryName: json['productCategoryName'] as String,
  medicinePrice: json['medicinePrice'] as String,
  medicineImage: json['medicineImage'] as String,
  uom: json['uom'] as String,
  stockQnty: json['stockQnty'] as String,
  createdBy: json['createdBy'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedBy: json['updatedBy'] as String?,
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  status: json['status'] as bool?,
  queryFlag: json['queryFlag'] as String?,
  imageUrl: json['imageUrl'] as String,
  medicineDesc: json['medicineDesc'] as String,
);

Map<String, dynamic> _$MedicineToJson(Medicine instance) => <String, dynamic>{
  'id': instance.id,
  'medicineName': instance.medicineName,
  'medicineCompany': instance.medicineCompany,
  'medicineType': instance.medicineType,
  'medicineTypeName': instance.medicineTypeName,
  'productCategory': instance.productCategory,
  'productCategoryName': instance.productCategoryName,
  'medicinePrice': instance.medicinePrice,
  'medicineImage': instance.medicineImage,
  'uom': instance.uom,
  'stockQnty': instance.stockQnty,
  'createdBy': instance.createdBy,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedBy': instance.updatedBy,
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'status': instance.status,
  'queryFlag': instance.queryFlag,
  'imageUrl': instance.imageUrl,
  'medicineDesc': instance.medicineDesc,
};
