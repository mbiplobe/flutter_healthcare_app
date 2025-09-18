import 'package:flutter/cupertino.dart';
import 'package:flutter_healthcare_app/src/domains/usecase/auth_usecase.dart';
import 'package:flutter_healthcare_app/src/model/contact_details.dart';
import 'package:flutter_healthcare_app/src/model/emergency_contact.dart';
import 'package:flutter_healthcare_app/src/model/login_response.dart';
import 'package:flutter_healthcare_app/src/model/registration.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';
import 'package:flutter_healthcare_app/src/theme/url.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthViewModel extends ChangeNotifier {
  AuthUsecase authUsecase;
  AuthViewModel({required this.authUsecase});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<RegistrationResponse> saveRegistration(
    Registration registration,
  ) async {
    _isLoading = true;
    notifyListeners();
    final response = await authUsecase.saveRegistration(registration);
    _isLoading = false;
    notifyListeners();
    return response;
  }

  Future<LoginResponse> getlogin(String email, String password) async {
    return authUsecase.getlogin(email, password);
  }

  Future<RegistrationResponse> saveEmergencyContact(Emergency emergency) async {
    var cartObj = jsonEncode(emergency);
    final response = await http.get(
      Uri.parse('${url.BASE_URL}saveToContact?cartobj=$cartObj'),
    );

    if (response.statusCode == 200) {
      return RegistrationResponse.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Exception: ${response.statusCode}');
    }
  }

  Future<ContactDetails> getContactDetails(String userId) async {
    final response = await http.get(
      Uri.parse('${url.BASE_URL}getContactDetails?userId=$userId'),
    );

    if (response.statusCode == 200) {
      return ContactDetails.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Exception: ${response.statusCode}');
    }
  }
}
