import 'package:flutter/cupertino.dart';
import 'package:flutter_healthcare_app/src/model/appointment.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';
import 'package:flutter_healthcare_app/src/model/view_appointment.dart';
import 'package:flutter_healthcare_app/src/theme/url.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AppointmentViewModel extends ChangeNotifier {
  
  Future<RegistrationResponse> saveAppointment(Appointment appointment) async {
    final uri = Uri.parse('${url.BASE_URL}userAppointment').replace(
      queryParameters: {
        'Patientuid': appointment.patientUid,
        'Doctorid': appointment.doctorId,
        'Dates': appointment.date,
        'Timeid': appointment.timeId,
        'Reasons': appointment.reason,
        'payment': appointment.payment,
      },
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return RegistrationResponse.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Exception: ${response.statusCode}');
    }
  }

  Future<RegistrationResponse> updateAppointment(
    Appointment appointment,
    String appointmentId,
  ) async {
    final uri = Uri.parse('${url.BASE_URL}updateAppointment').replace(
      queryParameters: {
        'appointmentId': appointmentId,
        'userid': appointment.patientUid,
        'docid': appointment.doctorId,
        'appointmentDate': appointment.date,
        'timeId': appointment.timeId,
        'reason': appointment.reason,
        'paymentMethod': appointment.payment,
      },
    );
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return RegistrationResponse.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Exception: ${response.statusCode}');
    }
  }

  Future<List<ViewAppointment>> getAllAppointment(
    int id,
    String userType,
  ) async {
    final response = await http.get(
      Uri.parse('${url.BASE_URL}getAppointment?userId=$id&userType=$userType'),
    );

    print(response.body);
    if (response.statusCode == 200) {
      List<ViewAppointment> appointment;

      Iterable list = json.decode(response.body);
      appointment = list
          .map((model) => ViewAppointment.fromJson(model))
          .toList();
      return appointment;
    } else {
      throw Exception('Exception: ${response.statusCode}');
    }
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
