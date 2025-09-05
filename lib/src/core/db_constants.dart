abstract class DbTableConstants {
  static const String userTable = 'user_table';
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

abstract class DDLCommandConstants {
 static const String UserTableCreate ='''CREATE TABLE ${DbTableConstants.userTable} (
    ${UserTableColumnConstants.id} INTEGER PRIMARY KEY,
    ${UserTableColumnConstants.firstName} TEXT,
    ${UserTableColumnConstants.lastName} TEXT,
    ${UserTableColumnConstants.userType} TEXT,
    ${UserTableColumnConstants.email} TEXT,
    ${UserTableColumnConstants.password} TEXT,
    ${UserTableColumnConstants.userPhone} TEXT
  );''';

}
