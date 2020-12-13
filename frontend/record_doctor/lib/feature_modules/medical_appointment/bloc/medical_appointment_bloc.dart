import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:record_doctor/api/record_doctor_api.dart';
import 'package:record_doctor/feature_modules/medical_appointment/bloc/medical_appointment_event.dart';
import 'package:record_doctor/feature_modules/medical_appointment/bloc/medical_appointment_state.dart';
import 'package:record_doctor/models/possible_disease.dart';
import 'package:record_doctor/models/patient.dart';

class MedicalAppointmentBloc
    extends Bloc<MedicalAppointmentEvent, MedicalAppointmentState> {
  MedicalAppointmentBloc(MedicalAppointmentState initialState)
      : super(initialState);
  TextFormField textFormField;
  bool isSymptom;
  TextFormField textFormFields;
  @override
  Stream<MedicalAppointmentState> mapEventToState(
    MedicalAppointmentEvent event,
  ) async* {
    if (event is InitialMedicalAppointmentEvent) {
      yield LoadingDataState();
      List<Patient> listPatient = await RecordDoctorApi().getPatients();
      yield LoadedPatientsState(patients: listPatient);
    }
    if (event is AddFieldInfoMedicalAppointmentEvent) {
      isSymptom = event.helperTextField == "Outro sintoma";

      textFormField = TextFormField(
        controller: TextEditingController(),
        decoration: InputDecoration(labelText: event.helperTextField),
      );
      yield LoadedFieldSymptomState(field: textFormField, isSymptom: isSymptom);
    }
    if (event is GerateDiagnosisMedicalAppointmentEvent) {
      yield LoadingDataState();
      List<PossibleDisease> possibleDisease =
          await RecordDoctorApi().getPossibleDisease(event.symptoms);
      yield LoadedDiagnosisPossibleState(possibleDisease: possibleDisease);
    }
  }
}
