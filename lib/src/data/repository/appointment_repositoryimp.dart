import 'package:flutter_healthcare_app/src/data/local/db_helper.dart';
import 'package:flutter_healthcare_app/src/data/models/appointment_db_model.dart';
import 'package:flutter_healthcare_app/src/data/repository/appointment_resitory.dart';

class AppointmentRepositoryImp implements AppointmentRepository {
  final DatabaseHelper mDatabaseHelper;

  AppointmentRepositoryImp({required this.mDatabaseHelper});

  @override
  Future<int> cancelAppointment(int id) {
    return mDatabaseHelper.cancelAppointment(id);
  }

  @override
  Future<List<AppointmentDbModel>> getAllAppointment(int id, String userType) {
    return mDatabaseHelper.fetchAllAppointments(id, userType);
  }

  @override
  Future<int> saveAppointment(AppointmentDbModel appointment) {
    return mDatabaseHelper.makeAppointment(appointment);
  }
  
  @override
  Future<int> updateAppointment(AppointmentDbModel appointment) {
    return mDatabaseHelper.updateAppointment(appointment);
  }
  
}