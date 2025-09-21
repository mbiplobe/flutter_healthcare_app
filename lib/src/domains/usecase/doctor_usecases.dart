import 'package:smart_health_care/src/model/doctor.dart';
import 'package:smart_health_care/src/model/registration_response.dart';

abstract class DoctorUsecases {
  Future<List<Doctor>> getDoctorList();
  Future<RegistrationResponse> insertDoctor(Doctor doctor);
}