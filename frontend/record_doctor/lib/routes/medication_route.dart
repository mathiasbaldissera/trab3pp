import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record_doctor/feature_modules/medication/bloc/medication_bloc.dart';
import 'package:record_doctor/feature_modules/medication/bloc/medication_state.dart';
import 'package:record_doctor/feature_modules/medication/medication_page.dart';

class MedicationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MedicationBloc>(
      create: (BuildContext context) =>
          MedicationBloc(InitialStateMedication()),
      child: MedicationPage(),
    );
  }
}
