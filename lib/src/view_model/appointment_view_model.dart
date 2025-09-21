
import 'package:flutter/cupertino.dart';
import 'package:smart_health_care/src/domains/usecase/appointment_usecase_interface.dart';
import 'package:smart_health_care/src/model/appointment.dart';
import 'package:smart_health_care/src/model/registration_response.dart';
import 'package:smart_health_care/src/model/view_appointment.dart';
import 'package:smart_health_care/src/theme/url.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AppointmentViewModel extends ChangeNotifier {
  AppointmentUseCase mAppointmentUseCase;

  AppointmentViewModel({required this.mAppointmentUseCase});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<RegistrationResponse> saveAppointment(Appointment appointment) async {
    _isLoading = true;
    notifyListeners();
    final response = await mAppointmentUseCase.saveAppointment(appointment);
    _isLoading = false;
    notifyListeners();
    return response;
  }

  Future<RegistrationResponse> updateAppointment(
    Appointment appointment,
    String appointmentId,
  ) async {
    _isLoading = true;
    notifyListeners();
    final response = await mAppointmentUseCase.updateAppointment(
      appointment,
      int.parse(appointmentId),
    );
    _isLoading = false;
    notifyListeners();
    return response;
  }

  Future<List<ViewAppointment>> getAllAppointment(
    int id,
    String userType,
  ) async {
     _isLoading = true;
    notifyListeners();
    final response = await mAppointmentUseCase.getAllAppointment(id, userType);
    _isLoading = false;
    notifyListeners();
    return response;
  }

  Future<RegistrationResponse> cancelAppointment(String id) async {
    final response = await http.get(
      Uri.parse('${url.BASE_URL}cancelAppointment?appointmentId=$id'),
    );

    print(response.body);
    if (response.statusCode == 200) {
      return RegistrationResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Exception: ${response.statusCode}');
    }
  }
}
