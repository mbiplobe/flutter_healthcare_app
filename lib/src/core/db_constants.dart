abstract class DbTableConstants {
  static const String userTable = 'user_table';
    static const String emergencyContactTable = 'emergency_contact_table';
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
  static const String postcode= 'post_code';
  static const String createdBy = 'created_by';
  static const String createdAt = 'created_at';
}

abstract class DDLCommandConstants {
 static const String UserTableCreate ='''CREATE TABLE ${DbTableConstants.userTable} (
    ${UserTableColumnConstants.id} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${UserTableColumnConstants.firstName} TEXT,
    ${UserTableColumnConstants.lastName} TEXT,
    ${UserTableColumnConstants.userType} TEXT '',
    ${UserTableColumnConstants.email} TEXT default '',
    ${UserTableColumnConstants.password} TEXT default '',
    ${UserTableColumnConstants.userPhone} TEXT default '',
       ${UserTableColumnConstants.gender} TEXT default ''
  );''';

   static const String EgergencyTableCreate ='''CREATE TABLE ${DbTableConstants.emergencyContactTable} (
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

}

