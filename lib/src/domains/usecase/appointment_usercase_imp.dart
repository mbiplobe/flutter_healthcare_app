import 'package:flutter_healthcare_app/src/data/models/appointment_db_model.dart';
import 'package:flutter_healthcare_app/src/data/repository/appointment_resitory.dart';
import 'package:flutter_healthcare_app/src/domains/usecase/appointment_usecase_interface.dart';
import 'package:flutter_healthcare_app/src/model/appointment.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';
import 'package:flutter_healthcare_app/src/model/view_appointment.dart';

class AppointmentUsercaseImp implements AppointmentUseCase 
{
  final AppointmentRepository mAppointmentRepository;

  AppointmentUsercaseImp({required this.mAppointmentRepository});

  @override
  Future<RegistrationResponse> cancelAppointment(int id) {
   
   return mAppointmentRepository.cancelAppointment(id).then((value) {
      if (value > 0) {
        return RegistrationResponse(
          success: true,
          message: "Appointment cancelled successfully",
        );
      } else {
        return RegistrationResponse(
          success: false,
          message: "Failed to cancel appointment",
        );
      }
    }).catchError((error) {
      return RegistrationResponse(
        success: false,
        message: "Error: ${error.toString()}",
      );
    });
  }

  @override
  Future<List<ViewAppointment>> getAllAppointment(int userId, String userType) 
  {
    return mAppointmentRepository.getAllAppointment(userId, userType).then((appointmentDbModels) {
      return appointmentDbModels.map((dbModel) => ViewAppointment(
        id: dbModel.id.toString(),
        patientUid: dbModel.patient_uid,
        doctorId: dbModel.doctor_id,
        dates: dbModel.appointment_date,
        timeId: dbModel.appointment_time,
        reasons: dbModel.reason??'',
        payMethod: dbModel.payment_method,
        status: dbModel.status??'',
        createdBy: dbModel.created_by,
        createdTime: dbModel.created_at,
        updatedBy: dbModel.updated_by,
        updatedTime: dbModel.updated_at, doctorName: '', speciality: '', doctorDept: '', appointmentTime: ''
      )).toList();
    }).catchError((error) {
      // Handle error appropriately, possibly returning an empty list or rethrowing the error
      return <ViewAppointment>[];
    });
  }

  @override
  Future<RegistrationResponse> saveAppointment(Appointment appointment) 
  {
    var model = AppointmentDbModel(
      patient_uid: appointment.patientUid??'',
      doctor_id: appointment.doctorId??'',
      appointment_date: appointment.date??'',
      appointment_time: appointment.timeId??'',
      reason: appointment.reason,
      payment_method: appointment.payment,
      status: 'comfirm', // Default status
      created_by: appointment.createdBy??'', // Assuming patient creates the appointment
      created_at: DateTime.now().toIso8601String()
    );
   return mAppointmentRepository.saveAppointment(model).then((value) {
      if (value > 0) {
        return RegistrationResponse(
          success: true,
          message: "Appointment saved successfully",
        );
      } else {
        return RegistrationResponse(
          success: false,
          message: "Failed to save appointment",
        );
      }
    }).catchError((error) {
      return RegistrationResponse(
        success: false,
        message: "Error: ${error.toString()}",
      );
    });
  }

  @override
  Future<RegistrationResponse> updateAppointment(Appointment appointment, int appointmentId) 
  {
    var model = AppointmentDbModel(
      id: appointmentId,
      patient_uid: appointment.patientUid??'',
      doctor_id: appointment.doctorId??'',
      appointment_date: appointment.date??'',
      appointment_time: appointment.timeId??'',
      reason: appointment.reason,
      payment_method: appointment.payment,
      status: appointment.status??'comfirm', // Default status
      updated_by: appointment.updatedBy??'', // Assuming patient creates the appointment
      updated_at: DateTime.now().toIso8601String()
    );
   return mAppointmentRepository.updateAppointment(model).then((value) {
      if (value > 0) {
        return RegistrationResponse(
          success: true,
          message: "Appointment updated successfully",
        );
      } else {
        return RegistrationResponse(
          success: false,
          message: "Failed to update appointment",
        );
      }
    }).catchError((error) {
      return RegistrationResponse(
        success: false,
        message: "Error: ${error.toString()}",
      );
    });
  }
}