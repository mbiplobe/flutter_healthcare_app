import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/config/route.dart';
import 'package:flutter_healthcare_app/src/core/constants.dart';
import 'package:flutter_healthcare_app/src/view_model/appointment_view_model.dart';
import 'package:flutter_healthcare_app/src/view_model/auth_view_model.dart';
import 'package:flutter_healthcare_app/src/view_model/doctor_view_model.dart';
import 'package:flutter_healthcare_app/src/theme/theme.dart';
import 'package:flutter_healthcare_app/src/view_model/eshop_view_model.dart';
import 'package:flutter_healthcare_app/src/view_model/lab_test_view_model.dart';
import 'package:flutter_healthcare_app/src/view_model/location_viewmodel.dart';
import 'package:flutter_healthcare_app/src/view_model/patient_appointment_View_model.dart';
import 'package:flutter_healthcare_app/src/view_model/service_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LocationViewModel()),
      ChangeNotifierProvider(
        create: (context) => DoctorViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => AuthViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => ServiceViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => AppointmentViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => LabTestViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => EShopViewModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => PatientAppointmentViewModel(),
      ),
    ],
    child: MyApp(),
  ));
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
