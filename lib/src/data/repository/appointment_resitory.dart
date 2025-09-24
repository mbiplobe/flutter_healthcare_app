import 'package:smarthealthcare/src/data/models/appointment_db_model.dart';

abstract class AppointmentRepository {
  Future<int> saveAppointment(AppointmentDbModel appointment);

  Future<int> updateAppointment(AppointmentDbModel appointment);

  Future<List<AppointmentDbModel>> getAllAppointment(int id, String userType);

  Future<int> cancelAppointment(int id);
}
