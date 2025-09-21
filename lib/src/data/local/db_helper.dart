import 'package:smart_health_care/src/core/db_constants.dart';
import 'package:smart_health_care/src/data/models/appointment_db_model.dart';
import 'package:smart_health_care/src/data/models/doctor_db_model.dart';
import 'package:smart_health_care/src/data/models/doctor_rating_model.dart';
import 'package:smart_health_care/src/data/models/user.dart';
import 'package:smart_health_care/src/model/emergency_contact.dart';
import 'package:smart_health_care/src/model/registration.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DbNameConstants.DatabaseName);

    return await openDatabase(path, version: 2, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    try {
      await db.execute(DDLCommandConstants.UserTableCreate);
      await db.execute(DDLCommandConstants.AppoinrmtmentTableCreate);
      await db.execute(DDLCommandConstants.DoctorTableCreate);
      await db.execute(DDLCommandConstants.RatingTableCreate);
      // await db.execute(DDLCommandConstants.EmergencyTableCreate);
    } catch (e) {
      print("Error creating tables: $e");
    }
  }

  Future<int> insertUser(Registration registration) async {
    try {
      final db = await database;
      final values = {
        UserTableColumnConstants.firstName: registration.firstName,
        UserTableColumnConstants.lastName: registration.lastName,
        UserTableColumnConstants.userType: registration.userType,
        UserTableColumnConstants.email: registration.userEmail,
        UserTableColumnConstants.password: registration.userPass,
        UserTableColumnConstants.userPhone: registration.userPhone,
        UserTableColumnConstants.gender: registration.gender,
      };
      return await db.insert(
        DbTableConstants.userTable,
        values,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print("Insert user error: $e");
      return -1; // failure code
    }
  }

  Future<int> insertEmergencyContact(Emergency emergency) async {
    try {
      final db = await database;
      return await db.insert(
        DbTableConstants.emergencyContactTable,
        emergency.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print("Insert emergency error: $e");
      return -1;
    }
  }

  Future<User?> getLogin(String email, String password) async {
    final db = await database;

    final result = await db.query(
      DbTableConstants.userTable,
      where:
          '${UserTableColumnConstants.email} = ? AND ${UserTableColumnConstants.password} = ?',
      whereArgs: [email, password],
      limit: 1,
    );

    if (result.isNotEmpty) {
      return User.fromJson(result.first);
    }
    return null;
  }

  ////////////////////////////////Appointment Segmentation////////////////////////////////////
  Future<int> makeAppointment(AppointmentDbModel appointment) async {
    try {
      final db = await database;
      final values = {
        AppointmentTableColumnConstants.PatientUid: appointment.patient_uid,
        AppointmentTableColumnConstants.Doctorid: appointment.doctor_id,
        AppointmentTableColumnConstants.AppointmentDate:
            appointment.appointment_date,
        AppointmentTableColumnConstants.AppointmentTime:
            appointment.appointment_time,
        AppointmentTableColumnConstants.Reason: appointment.reason,
        AppointmentTableColumnConstants.PaymentMethod:
            appointment.payment_method,
        AppointmentTableColumnConstants.Status: appointment.status,
        AppointmentTableColumnConstants.CreatedBy: appointment.created_by,
        AppointmentTableColumnConstants.CreatedAt: appointment.created_at,
      };
      return await db.insert(
        DbTableConstants.AppointmentTable,
        values,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print("Insert user error: $e");
      return -1; // failure code
    }
  }

  Future<List<AppointmentDbModel>> fetchAllAppointments(
    int userId,
    String userType,
  ) async {
    try {
      final db = await database;
      final result = await db.query(
        DbTableConstants.AppointmentTable,

        where: userType == 'patient'
            ? '${AppointmentTableColumnConstants.PatientUid} = ?'
            : '${AppointmentTableColumnConstants.Doctorid} = ?',
        whereArgs: [userId],
      );
      return result.map((json) => AppointmentDbModel.fromJson(json)).toList();
    } catch (e) {
      print("Fetch appointments error: $e");
      return [];
    }
  }

  Future<int> updateAppointment(AppointmentDbModel appointment) async {
    try {
      final db = await database;
      final values = {
        AppointmentTableColumnConstants.PatientUid: appointment.patient_uid,
        AppointmentTableColumnConstants.Doctorid: appointment.doctor_id,
        AppointmentTableColumnConstants.AppointmentDate:
            appointment.appointment_date,
        AppointmentTableColumnConstants.AppointmentTime:
            appointment.appointment_time,
        AppointmentTableColumnConstants.Reason: appointment.reason,
        AppointmentTableColumnConstants.PaymentMethod:
            appointment.payment_method,
        AppointmentTableColumnConstants.Status: appointment.status,
        AppointmentTableColumnConstants.UpdateBy: appointment.updated_by,
        AppointmentTableColumnConstants.UpdatedAt: appointment.updated_at,
      };
      return await db.update(
        DbTableConstants.AppointmentTable,
        values,
        where: '${AppointmentTableColumnConstants.AppointId} = ?',
        whereArgs: [appointment.id],
      );
    } catch (e) {
      return -1; // failure code
    }
  }

  Future<int> cancelAppointment(int appointmentId) async {
    try {
      final db = await database;
      return await db.delete(
        DbTableConstants.AppointmentTable,
        where: '${AppointmentTableColumnConstants.AppointId} = ?',
        whereArgs: [appointmentId],
      );
    } catch (e) {
      print("Cancel appointment error: $e");
      return -1; // failure code
    }
  }

  ////////////////////////////////Appointment Segmentation////////////////////////////////////
  ///
  /// Emergency Contact Segmentation
  Future<int> insertDoctor(DoctorDbModel doctor) async {
    try {
      final db = await database;
      final values = {
        DoctorTableColumnConstants.Id: doctor.id,
        DoctorTableColumnConstants.Name: doctor.name,
        DoctorTableColumnConstants.Department: doctor.department,
        DoctorTableColumnConstants.About: doctor.about,
        DoctorTableColumnConstants.Education: doctor.education,
        DoctorTableColumnConstants.Experience: doctor.experience,
        DoctorTableColumnConstants.Gender: doctor.gender,
        DoctorTableColumnConstants.Fees: doctor.fees,
        DoctorTableColumnConstants.IsActive: doctor.is_active,
        DoctorTableColumnConstants.JoinDate: doctor.join_date,
        DoctorTableColumnConstants.Latitude: doctor.latitude,
        DoctorTableColumnConstants.Longitude: doctor.longitude,
        DoctorTableColumnConstants.Location: doctor.location,
      };
      return await db.insert(
        DbTableConstants.DoctorTable,
        values,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print("Insert user error: $e");
      return -1; // failure code
    }
  }

  Future<List<DoctorDbModel>> fetchAllDoctors() async {
    try {
      final db = await database;
      final result = await db.query(DbTableConstants.DoctorTable);
      return result.map((json) => DoctorDbModel.fromJson(json)).toList();
    } catch (e) {
      print("Fetch doctors error: $e");
      return [];
    }
  }

/// doctor rating by ID
  Future<List<DoctorRatingModel>> getDoctorRatingByID(int docID) async {
    try {
      final db = await database;
      final result = await db.query(
       DbTableConstants.DoctorRtaingTable, // Assuming the table name is 'doctor_ratings'
        where: RatingTableColumnConstants.Doctorid+ ' = ?',
        whereArgs: [docID],
      );
      return result.map((json) => DoctorRatingModel.fromJson(json)).toList();
    } catch (e) {
      print("Fetch doctor ratings error: $e");
      return [];
    }
  }

Future<int> insertDoctorRating(DoctorRatingModel doctorRating) async {
    try {
      final db = await database;
      final values = {
        RatingTableColumnConstants.Id: doctorRating.id,
        RatingTableColumnConstants.Rating: doctorRating.rating,
        RatingTableColumnConstants.Review: doctorRating.review,
        RatingTableColumnConstants.CreatedAt: doctorRating.created_at,
        RatingTableColumnConstants.CreatedBy: doctorRating.created_by
      };
      return await db.insert(
        DbTableConstants.DoctorTable,
        values,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print("Insert user error: $e");
      return -1; // failure code
    }
  }



}
