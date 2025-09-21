import 'package:smart_health_care/src/model/appointment.dart';
import 'package:smart_health_care/src/model/registration_response.dart';
import 'package:smart_health_care/src/model/view_appointment.dart';

abstract class AppointmentUseCase {
  
  Future<RegistrationResponse> saveAppointment(Appointment appointment);

  Future<RegistrationResponse> updateAppointment(Appointment appointment,int appointmentId);

  Future<List<ViewAppointment>> getAllAppointment(int userId,String userType);

  Future<RegistrationResponse> cancelAppointment(int id);

}
