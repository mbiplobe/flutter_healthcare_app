import 'package:smarthealthcare/src/data/models/doctor_db_model.dart';
import 'package:smarthealthcare/src/data/models/doctor_rating_model.dart';

abstract class DoctorRepository {
  Future<List<DoctorDbModel>> fetchAllDoctors();
  Future<int> insertDoctor(DoctorDbModel doctor);
  Future<List<DoctorRatingModel>> getDoctorRatingByID(int docID);
}