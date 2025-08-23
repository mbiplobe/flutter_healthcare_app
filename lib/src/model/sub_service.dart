import 'package:json_annotation/json_annotation.dart';

part 'sub_service.g.dart';

@JsonSerializable()
class SubService {
  final String id;
  final String serviceCenterName;
  final String serviceCenterAddress;
  final String latitude;
  final String longitude;
  final String phone;
  final String email;
  final String ownerName;
  final dynamic status;
  final dynamic createdBy;
  final dynamic createdAt;
  final String serviceType;
  final String serviceTypeName;
  final String serviceTags;
  final dynamic queryFlag;

  SubService({
    required this.id,
    required this.serviceCenterName,
    required this.serviceCenterAddress,
    required this.latitude,
    required this.longitude,
    required this.phone,
    required this.email,
    required this.ownerName,
    this.status,
    this.createdBy,
    this.createdAt,
    required this.serviceType,
    required this.serviceTypeName,
    required this.serviceTags,
    this.queryFlag,
  });

  factory SubService.fromJson(Map<String, dynamic> json) =>
      _$SubServiceFromJson(json);

  Map<String, dynamic> toJson() => _$SubServiceToJson(this);
}
