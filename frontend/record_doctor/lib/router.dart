import 'package:flutter/material.dart';
import 'package:record_doctor/constants/constant_routes.dart';
import 'package:record_doctor/routes/disease_route.dart';
import 'package:record_doctor/routes/home_route.dart';
import 'package:record_doctor/routes/medical_appointment_route.dart';
import 'package:record_doctor/routes/medication_route.dart';
import 'package:record_doctor/routes/patient_route.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRouteNavigator:
      return MaterialPageRoute(builder: (context) => HomeRoute());
    case PatientRouteNavigator:
      return MaterialPageRoute(builder: (context) => PatientRoute());
    case MedicationRouteNavigator:
      return MaterialPageRoute(builder: (context) => MedicationRoute());
    case DiseaseRouteNavigator:
      return MaterialPageRoute(builder: (context) => DiseaseRoute());
    case MedicalAppointmentRouteNavigator:
      return MaterialPageRoute(builder: (context) => MedicalAppointmentRoute());
    default:
      return MaterialPageRoute(builder: (context) => HomeRoute());
  }
}
