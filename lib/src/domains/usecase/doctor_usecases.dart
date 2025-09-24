import 'package:smarthealthcare/src/model/doctor.dart';
import 'package:smarthealthcare/src/model/registration_response.dart';

abstract class DoctorUsecases {
  Future<List<Doctor>> getDoctorList();
  Future<RegistrationResponse> insertDoctor(Doctor doctor);
}