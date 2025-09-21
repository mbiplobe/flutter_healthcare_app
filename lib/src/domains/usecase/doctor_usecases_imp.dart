import 'package:flutter_healthcare_app/src/data/models/doctor_db_model.dart';
import 'package:flutter_healthcare_app/src/data/repository/doctor_repository.dart';
import 'package:flutter_healthcare_app/src/domains/usecase/doctor_usecases.dart';
import 'package:flutter_healthcare_app/src/model/doctor.dart';
import 'package:flutter_healthcare_app/src/model/registration_response.dart';

class DoctorUsecasesImp implements DoctorUsecases {
  DoctorRepository doctorRepository;

  DoctorUsecasesImp({required this.doctorRepository});
  // @override
  // Future<List<Doctor>> fetchAllDoctors() async {
  //   final doctorDbModels = await doctorRepository.fetchAllDoctors();
  //   return doctorDbModels.map((dbModel) => Doctor.fromDbModel(dbModel)).toList();
  // }

  @override
  Future<List<Doctor>> getDoctorList() {
    return doctorRepository
        .fetchAllDoctors()
        .then((doctorDbModel) {
          return doctorDbModel
              .map(
                (dbModel) => Doctor(
                  id: dbModel.id.toString(),
                  name: dbModel.name,
                  department: dbModel.department,
                  specialist: dbModel.specialist,
                  education: dbModel.education,
                  experience: dbModel.experience,
                  about: dbModel.about,
                  fees: dbModel.fees,
                  joinDate: dbModel.join_date != null
                      ? DateTime.tryParse(dbModel.join_date!)
                      : null,
                  phone: dbModel.photo,
                  gender: dbModel.gender,
                  isActive: dbModel.is_active == 1,
                  createdBy: dbModel.created_by,
                  createdTime: dbModel.created_time != null
                      ? DateTime.tryParse(dbModel.created_time!)
                      : null,
                  updatedBy: dbModel.updated_by,
                  updatedTime: dbModel.updated_time != null
                      ? DateTime.tryParse(dbModel.updated_time!)
                      : null,
                  location: dbModel.location,
                  latitude: dbModel.latitude,
                  longitude: dbModel.longitude,
                ),
              )
              .toList();
        })
        .catchError((error) {
          // Handle error appropriately, possibly returning an empty list or rethrowing the error
          return <Doctor>[];
        });
  }

  @override
  Future<RegistrationResponse> insertDoctor(Doctor doctor) {
    // TODO: implement insertDoctor
    throw UnimplementedError();
  }
}
