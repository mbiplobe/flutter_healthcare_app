import 'package:flutter_healthcare_app/src/model/doctor.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';

abstract class DoctorUsecases {
  Future<List<Doctor>> getDoctorList();
  Future<RegistrationResponse> insertDoctor(Doctor doctor);
}