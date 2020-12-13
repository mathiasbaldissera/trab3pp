import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:record_doctor/api/record_doctor_api.dart';
import 'package:record_doctor/feature_modules/medication/bloc/medication_event.dart';
import 'package:record_doctor/feature_modules/medication/bloc/medication_state.dart';
import 'package:record_doctor/models/medicine.dart';

class MedicationBloc extends Bloc<MedicationEvent, MedicationState> {
  MedicationBloc(MedicationState initialState) : super(initialState);
  TextFormField textFormField;
  @override
  Stream<MedicationState> mapEventToState(
    MedicationEvent event,
  ) async* {
    if (event is AddMoreFunctionMedication) {
      textFormField = TextFormField(
        controller: TextEditingController(),
        decoration: InputDecoration(labelText: "Outra função"),
      );
      yield LoadedListFunctionsMedicationState(field: textFormField);
    }
    if (event is CreateNewMedicationEvent) {
      yield LoadingProcessCreateMedicationState();
      if (event.name.isEmpty || event.functionsMedication.length == 0) {
        yield CreatedFailedMedicationState();
      } else if (event.name.isNotEmpty &&
          event.functionsMedication.length > 0) {
        Medicine medicine =
            Medicine(name: event.name, functions: event.functionsMedication);
        bool response = await RecordDoctorApi().createMedication(medicine);
        if (response) {
          yield CreatedSucessMedicationState();
        } else {
          yield CreatedFailedMedicationState();
        }
      }
    }
  }
}
