import 'package:json_annotation/json_annotation.dart';

part 'medicine_type.g.dart';

@JsonSerializable()
class MedicineType {
  final String id;
  final String medicineTypeName;
  final String imageUrl;
  final String status;

  MedicineType({
    required this.id,
    required this.medicineTypeName,
    required this.imageUrl,
    required this.status,
  });

  factory MedicineType.fromJson(Map<String, dynamic> json) =>
      _$MedicineTypeFromJson(json);

  Map<String, dynamic> toJson() => _$MedicineTypeToJson(this);
}
