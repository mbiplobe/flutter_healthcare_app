import 'package:flutter_healthcare_app/src/data/models/user.dart';
import 'package:flutter_healthcare_app/src/model/contact_details.dart';
import 'package:flutter_healthcare_app/src/model/emergency_contact.dart';
import 'package:flutter_healthcare_app/src/model/registration.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';

abstract class AuthRepository {
  Future<void> registerUser(String username, String password, String email);
  
  Future<User?> getlogin(String email, String password);

  Future<RegistrationResponse> saveEmergencyContact(Emergency emergency);

  Future<ContactDetails> getContactDetails(String userId);

  Future<int?> saveRegistration(Registration registration);

}
