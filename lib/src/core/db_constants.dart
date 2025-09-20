abstract class DbTableConstants {
  static const String userTable = 'user_table';
  static const String emergencyContactTable = 'emergency_contact_table';
  static const String AppointmentTable = 'appointment_table';
  static const String DoctorTable = 'doctor_table';
}

abstract class DbNameConstants {
  static const String DatabaseName = 'edoctorsheba.db';
}

abstract class UserTableColumnConstants {
  static const String id = 'id';
  static const String firstName = 'first_name';
  static const String lastName = 'last_name';
  static const String userType = 'user_type';
  static const String email = 'email';
  static const String userPhone = 'user_phone';
  static const String gender = 'gender';
  static const String address = 'address';
  static const String password = 'password';
}

abstract class EmegencyTableColumnConstants {
  static const String id = 'id';
  static const String userId = 'user_id';
  static const String contactPerson = 'person_name';
  static const String contactPersonPhone = 'person_phone';
  static const String address = 'address';
  static const String userPhone = 'user_phone';
  static const String postcode = 'post_code';
  static const String createdBy = 'created_by';
  static const String createdAt = 'created_at';
}

abstract class AppointmentTableColumnConstants {
  static const String AppointId = 'id';
  static const String PatientUid = 'patient_uid';
  static const String Doctorid = 'doctor_id';
  static const String AppointmentDate = 'appointment_date';
  static const String AppointmentTime = 'appointment_time';
  static const String Reason = 'reason';
  static const String PaymentMethod = 'payment_method';
  static const String Status = 'status';
  static const String CreatedBy = 'created_by';
  static const String CreatedAt = 'created_at';
  static const String UpdateBy = 'updated_by';
  static const String UpdatedAt = 'updated_at';
}

abstract class DoctorTableColumnConstants {
  static const String Id = 'id';
  static const String Name = 'name';
  static const String Department = 'department';
  static const String Specialist = 'specialist';
  static const String Phone = 'phone';
  static const String Education = 'education';
  static const String Experience = 'experience';
  static const String About = 'about';
  static const String Fees = 'fees';
  static const String JoinDate = 'join_date';
  static const String Photo = 'photo';
  static const String Gender = 'gender';
  static const String IsActive = 'is_active';
  static const String CreatedBy = 'created_by';
  static const String CreatedTime = 'created_time';
  static const String UpdatedBy = 'updated_by';
  static const String UpdatedTime = 'updatedTime';
  static const String Location = 'location';
  static const String Latitude = 'latitude';
  static const String Longitude = 'longitude';
}

abstract class DDLCommandConstants {
  static const String UserTableCreate =
      '''CREATE TABLE ${DbTableConstants.userTable} (
    ${UserTableColumnConstants.id} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${UserTableColumnConstants.firstName} TEXT,
    ${UserTableColumnConstants.lastName} TEXT,
    ${UserTableColumnConstants.userType} TEXT '',
    ${UserTableColumnConstants.email} TEXT default '',
    ${UserTableColumnConstants.password} TEXT default '',
    ${UserTableColumnConstants.userPhone} TEXT default '',
       ${UserTableColumnConstants.gender} TEXT default ''
  );''';

  static const String EgergencyTableCreate =
      '''CREATE TABLE ${DbTableConstants.emergencyContactTable} (
    ${EmegencyTableColumnConstants.id} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${EmegencyTableColumnConstants.contactPerson} TEXT,
    ${EmegencyTableColumnConstants.contactPersonPhone} TEXT,
    ${EmegencyTableColumnConstants.address} TEXT,
    ${EmegencyTableColumnConstants.postcode} TEXT,
    ${EmegencyTableColumnConstants.userId} TEXT,
    ${EmegencyTableColumnConstants.createdBy} TEXT,
    ${EmegencyTableColumnConstants.createdAt} TEXT,
    ${EmegencyTableColumnConstants.userPhone} TEXT
  );''';

  static const String AppoinrmtmentTableCreate =
      '''CREATE TABLE ${DbTableConstants.AppointmentTable} (
    ${AppointmentTableColumnConstants.AppointId} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${AppointmentTableColumnConstants.PatientUid} TEXT,
    ${AppointmentTableColumnConstants.Doctorid} TEXT,
    ${AppointmentTableColumnConstants.AppointmentDate} TEXT,
    ${AppointmentTableColumnConstants.AppointmentTime} TEXT,
    ${AppointmentTableColumnConstants.PaymentMethod} TEXT,
    ${AppointmentTableColumnConstants.Reason} TEXT,
    ${AppointmentTableColumnConstants.Status} TEXT,
     ${AppointmentTableColumnConstants.CreatedBy} TEXT,
    ${AppointmentTableColumnConstants.CreatedAt} TEXT,
    ${AppointmentTableColumnConstants.UpdateBy} TEXT,
    ${AppointmentTableColumnConstants.UpdatedAt} TEXT
  );''';

  static const String DoctorTableCreate =
      '''CREATE TABLE ${DbTableConstants.DoctorTable} (
    ${DoctorTableColumnConstants.Id} TEXT PRIMARY KEY,
    ${DoctorTableColumnConstants.Name} TEXT,
    ${DoctorTableColumnConstants.Department} TEXT,
    ${DoctorTableColumnConstants.Specialist} TEXT,
    ${DoctorTableColumnConstants.Phone} TEXT,
    ${DoctorTableColumnConstants.Education} TEXT,
    ${DoctorTableColumnConstants.Experience} TEXT,
    ${DoctorTableColumnConstants.About} TEXT,
    ${DoctorTableColumnConstants.Fees} TEXT,
    ${DoctorTableColumnConstants.JoinDate} TEXT,
    ${DoctorTableColumnConstants.Photo} TEXT,
    ${DoctorTableColumnConstants.Gender} TEXT,
    ${DoctorTableColumnConstants.IsActive} INTEGER,
    ${DoctorTableColumnConstants.CreatedBy} TEXT,
    ${DoctorTableColumnConstants.CreatedTime} TEXT,
    ${DoctorTableColumnConstants.UpdatedBy} TEXT,
    ${DoctorTableColumnConstants.UpdatedTime} TEXT,
    ${DoctorTableColumnConstants.Location} TEXT,
    ${DoctorTableColumnConstants.Latitude} TEXT,
    ${DoctorTableColumnConstants.Longitude} TEXT
  );''';
}
