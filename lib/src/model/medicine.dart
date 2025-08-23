import 'package:json_annotation/json_annotation.dart';

part 'medicine.g.dart';

@JsonSerializable()
class Medicine {
  final String id;
  final String medicineName;
  final String medicineCompany;
  final String medicineType;
  final String medicineTypeName;
  final String productCategory;
  final String productCategoryName;
  final String medicinePrice;
  final String medicineImage;
  final String uom;
  final String stockQnty;
  final String? createdBy;
  final DateTime? createdAt;
  final String? updatedBy;
  final DateTime? updatedAt;
  final bool? status;
  final String? queryFlag;
  final String imageUrl;
  final String medicineDesc;

  Medicine({
    required this.id,
    required this.medicineName,
    required this.medicineCompany,
    required this.medicineType,
    required this.medicineTypeName,
    required this.productCategory,
    required this.productCategoryName,
    required this.medicinePrice,
    required this.medicineImage,
    required this.uom,
    required this.stockQnty,
    this.createdBy,
    this.createdAt,
    this.updatedBy,
    this.updatedAt,
    this.status,
    this.queryFlag,
    required this.imageUrl,
    required this.medicineDesc,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) =>
      _$MedicineFromJson(json);

  Map<String, dynamic> toJson() => _$MedicineToJson(this);
}
