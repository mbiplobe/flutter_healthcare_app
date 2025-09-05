import 'package:flutter_healthcare_app/src/core/db_constants.dart';
import 'package:flutter_healthcare_app/src/model/registration.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    String path = await getDatabasesPath() + 'eShop.db';
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(DDLCommandConstants.UserTableCreate);
  }


  Future<int?> insertUser(Registration registration) async {
  var values = {
    UserTableColumnConstants.firstName: registration.firstName,
    UserTableColumnConstants.lastName: registration.lastName,
    UserTableColumnConstants.userType: registration.userType,
    UserTableColumnConstants.email: registration.userEmail,
    UserTableColumnConstants.password: registration.userPass,
    UserTableColumnConstants.userPhone: registration.userPhone,
  };

  return await _database?.insert(
    DbTableConstants.userTable,
    values,
    conflictAlgorithm: ConflictAlgorithm.replace, // optional
  );
}


  // Future<List<User>> getUsers() async {
  //   final dbClient = await db;
  //   final result = await dbClient.query('users');
  //   return result.map((e) => User.fromMap(e)).toList();
  // }

  // Future<int> updateUser(User user) async {
  //   final dbClient = await db;
  //   return await dbClient.update(
  //     'users',
  //     user.toMap(),
  //     where: 'id = ?',
  //     whereArgs: [user.id],
  //   );
  // }

  // Future<int> deleteUser(int id) async {
  //   final dbClient = await db;
  //   return await dbClient.delete(
  //     'users',
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );
  // }
}
