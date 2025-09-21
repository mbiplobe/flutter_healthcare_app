
import 'package:smart_health_care/src/data/local/db_helper.dart';
import 'package:smart_health_care/src/data/models/user.dart';
import 'package:smart_health_care/src/data/repository/auth_repository.dart';
import 'package:smart_health_care/src/model/contact_details.dart';
import 'package:smart_health_care/src/model/emergency_contact.dart';
import 'package:smart_health_care/src/model/registration.dart';
import 'package:smart_health_care/src/model/registration_response.dart';

class AuthRepositoryimp implements AuthRepository {
  final DatabaseHelper mDatabaseHelper;

  AuthRepositoryimp({required this.mDatabaseHelper});

  @override
  Future<void> registerUser(String username, String password, String email) async {
    // await mDatabaseHelper.registerUser(username, password, email);
  }

  @override
  Future<User?> getlogin(String email, String password) async {
    return await mDatabaseHelper.getLogin(email, password);
  }

  @override
  Future<ContactDetails> getContactDetails(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<RegistrationResponse> saveEmergencyContact(Emergency emergency) {
     throw UnimplementedError();
  }

  @override
  Future<int?> saveRegistration(Registration registration) async {
    return await mDatabaseHelper.insertUser(registration);
  }
}