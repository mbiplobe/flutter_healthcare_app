import 'package:json_annotation/json_annotation.dart';

part 'emergency_contact.g.dart';

@JsonSerializable(explicitToJson: true)
class Emergency {
  final String userid;
  final String address;
  final String userphone;
  final String postcode;
  final String createdBy;
  final DateTime? createdAt;
  final List<EmergencyContactList> emergencyList;

  Emergency({
    required this.userid,
    required this.address,
    required this.userphone,
    required this.postcode,
    required this.createdBy,
    this.createdAt,
    this.emergencyList = const [],
  });

  factory Emergency.fromJson(Map<String, dynamic> json) =>
      _$EmergencyFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyToJson(this);
}

@JsonSerializable()
class EmergencyContactList {
  final String emergencyContactPerson;
  final String emergencyContactPhone;

  EmergencyContactList({
    required this.emergencyContactPerson,
    required this.emergencyContactPhone,
  });

  factory EmergencyContactList.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactListFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyContactListToJson(this);
}
