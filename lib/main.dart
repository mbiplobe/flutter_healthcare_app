import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/config/route.dart';
import 'package:flutter_healthcare_app/src/core/constants.dart';
import 'package:flutter_healthcare_app/src/core/db_constants.dart';
import 'package:flutter_healthcare_app/src/data/local/db_helper.dart';
import 'package:flutter_healthcare_app/src/data/repository/auth_repositoryImp.dart';
import 'package:flutter_healthcare_app/src/domains/usecase/auth_usecase.dart';
import 'package:flutter_healthcare_app/src/view_model/appointment_view_model.dart';
import 'package:flutter_healthcare_app/src/view_model/eshop_view_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter_healthcare_app/src/view_model/auth_view_model.dart';
import 'package:flutter_healthcare_app/src/theme/theme.dart';
import 'package:flutter_healthcare_app/src/view_model/location_viewmodel.dart';
import 'package:provider/provider.dart';

Future<void> deleteMyDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, DbNameConstants.DatabaseName); // your db name
  await deleteDatabase(path);
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Uncomment for testing only (delete database on every restart)
  //await deleteMyDatabase();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationViewModel()),

        // Step 1: Database
        Provider<DatabaseHelper>(create: (_) => DatabaseHelper.instance),

        // Step 2: Repository
        ProxyProvider<DatabaseHelper, AuthRepositoryimp>(
          update: (_, dbHelper, __) =>
              AuthRepositoryimp(mDatabaseHelper: dbHelper),
        ),

        // Step 3: Usecase
        ProxyProvider<AuthRepositoryimp, AuthUsecase>(
          update: (_, authRepository, __) =>
              AuthUsecase(authRepository: authRepository),
        ),

        // Step 4: ViewModel
       ChangeNotifierProxyProvider<AuthUsecase, AuthViewModel>(
          create: (context) => AuthViewModel(
            authUsecase: AuthUsecase(
              authRepository: AuthRepositoryimp(
                mDatabaseHelper: DatabaseHelper.instance,
              ),
            ),
          ),
          update: (context, value, previous) =>
              AuthViewModel(authUsecase: value),
        ),

        ChangeNotifierProvider(create: (_) => AppointmentViewModel()),
        ChangeNotifierProvider(create: (_) => EShopViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConfigurations.appTitle,
      theme: AppTheme.lightTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
