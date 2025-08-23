import 'package:json_annotation/json_annotation.dart';

part 'contact_details.g.dart';

@JsonSerializable(explicitToJson: true)
class ContactDetails {
  final String userid;
  final String address;
  final String userphone;
  final String postcode;
  final String createdBy;
  final DateTime? createdAt;
  final String? updateBy;
  final DateTime? updateAt;
  final String? id;
  final String? emergencyContactPerson;
  final String? emergencyContactPhone;
  final List<EmergencyList> emergencyList;

  ContactDetails({
    required this.userid,
    required this.address,
    required this.userphone,
    required this.postcode,
    required this.createdBy,
    this.createdAt,
    this.updateBy,
    this.updateAt,
    this.id,
    this.emergencyContactPerson,
    this.emergencyContactPhone,
    this.emergencyList = const [],
  });

  factory ContactDetails.fromJson(Map<String, dynamic> json) => _$ContactDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ContactDetailsToJson(this);
}

@JsonSerializable()
class EmergencyList {
  final String emergencyContactPerson;
  final String emergencyContactPhone;

  EmergencyList({
    required this.emergencyContactPerson,
    required this.emergencyContactPhone,
  });

  factory EmergencyList.fromJson(Map<String, dynamic> json) =>_$EmergencyListFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyListToJson(this);
}