import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record_doctor/feature_modules/medical_appointment/bloc/medical_appointment_bloc.dart';
import 'package:record_doctor/feature_modules/medical_appointment/bloc/medical_appointment_state.dart';
import 'package:record_doctor/feature_modules/medical_appointment/medical_appointment_page.dart';

class MedicalAppointmentRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MedicalAppointmentBloc>(
      create: (BuildContext context) =>
          MedicalAppointmentBloc(InitialStateMedicalAppointment()),
      child: MedicalAppointmentPage(),
    );
  }
}
