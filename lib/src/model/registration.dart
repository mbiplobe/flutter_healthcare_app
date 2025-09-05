import 'package:json_annotation/json_annotation.dart';

part 'registration.g.dart';

@JsonSerializable()
class Registration {
  final String username;
  final String firstName;
  final String lastName;
  final String userEmail;
  final String userPhone;
  final String userPass;
  final String address;
  final String gender;
  final String dob;
    final String userType;

  Registration({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.userEmail,
    required this.userPhone,
    required this.userPass,
    required this.address,
    required this.gender,
    required this.dob,
    required this.userType
  });
}
