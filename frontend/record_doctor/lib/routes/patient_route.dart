import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record_doctor/feature_modules/patient_area/components/patient_page.dart';
import 'package:record_doctor/feature_modules/patient_area/patient/patient_bloc.dart';
import 'package:record_doctor/feature_modules/patient_area/patient/patient_state.dart';

class PatientRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PatientBloc>(
      create: (BuildContext context) => PatientBloc(InitialStatePatient()),
      child: PatientPage(),
    );
  }
}
