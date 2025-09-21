import 'package:flutter_healthcare_app/src/data/local/db_helper.dart';
import 'package:flutter_healthcare_app/src/data/models/doctor_db_model.dart';
import 'package:flutter_healthcare_app/src/data/models/doctor_rating_model.dart';
import 'package:flutter_healthcare_app/src/data/repository/doctor_repository.dart';

class DoctorRepositoryimp implements DoctorRepository {
    final DatabaseHelper dbHelpert;
  DoctorRepositoryimp({required this.dbHelpert});
  
  @override
  Future<List<DoctorDbModel>> fetchAllDoctors() {
    return dbHelpert.fetchAllDoctors();
  }

  @override
  Future<List<DoctorRatingModel>> getDoctorRatingByID(int docID) {
    return dbHelpert.getDoctorRatingByID(docID);
  }

  @override
  Future<int> insertDoctor(DoctorDbModel doctor) {
    return dbHelpert.insertDoctor(doctor);
  }
}