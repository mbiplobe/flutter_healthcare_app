import 'package:flutter_healthcare_app/src/core/db_constants.dart';
import 'package:flutter_healthcare_app/src/data/models/user.dart';
import 'package:flutter_healthcare_app/src/model/emergency_contact.dart';
import 'package:flutter_healthcare_app/src/model/registration.dart';
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

    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    try {
      await db.execute(DDLCommandConstants.UserTableCreate);
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
      where: '${UserTableColumnConstants.email} = ? AND ${UserTableColumnConstants.password} = ?',
      whereArgs: [email, password],
      limit: 1,
    );

    if (result.isNotEmpty) {
      return User.fromJson(result.first);
    }
    return null;
  }
}
