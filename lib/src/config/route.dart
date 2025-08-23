import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/model/doctor.dart';
import 'package:flutter_healthcare_app/src/pages/detail_page.dart';
import 'package:flutter_healthcare_app/src/pages/doctor_consultant_page.dart';
import 'package:flutter_healthcare_app/src/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.splashRoute,
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.homeRoute,
      builder: (context, state) => DoctorConsultantPage(),
    ),
    GoRoute(
      path: AppRoutes.detailsRoute,
      builder: (context, state) {
        final doctor = state.extra as Doctor; // cast if you know the type
        return DetailPage(doctor: doctor);
      },
    ),
  ],
  errorBuilder: (context, state) {
    return Scaffold(
      body: Center(
        child: Text('${state.error}'),
      ),
    );
  },
);

class AppRoutes {
  static const splashRoute = "/";
  static const homeRoute = "/HomePage";
  static const detailsRoute = "/DetailPage";
}
