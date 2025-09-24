import 'package:smarthealthcare/src/model/appointment.dart';
import 'package:smarthealthcare/src/model/registration_response.dart';
import 'package:smarthealthcare/src/model/view_appointment.dart';

abstract class AppointmentUseCase {
  
  Future<RegistrationResponse> saveAppointment(Appointment appointment);

  Future<RegistrationResponse> updateAppointment(Appointment appointment,int appointmentId);

  Future<List<ViewAppointment>> getAllAppointment(int userId,String userType);

  Future<RegistrationResponse> cancelAppointment(int id);

}
