import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

@JsonSerializable()
class Service {
  final String id;
  final String name;
  final String description;
  final dynamic icon;
  final dynamic type;
  final dynamic isActive;
  final dynamic createdBy;
  final dynamic createdTime;
  final dynamic updatedBy;
  final dynamic updatedTime;
  final dynamic sortBy;
  final dynamic isView;
  final dynamic viewBy;
  final dynamic viewTime;
  final dynamic jsonDetails;
  final dynamic queryFlag;

  Service({
    required this.id,
    required this.name,
    required this.description,
    this.icon,
    this.type,
    this.isActive,
    this.createdBy,
    this.createdTime,
    this.updatedBy,
    this.updatedTime,
    this.sortBy,
    this.isView,
    this.viewBy,
    this.viewTime,
    this.jsonDetails,
    this.queryFlag,
  });

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}
