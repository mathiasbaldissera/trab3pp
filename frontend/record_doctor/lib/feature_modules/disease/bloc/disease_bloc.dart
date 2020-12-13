import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:record_doctor/api/record_doctor_api.dart';
import 'package:record_doctor/feature_modules/disease/bloc/disease_event.dart';
import 'package:record_doctor/feature_modules/disease/bloc/disease_state.dart';
import 'package:record_doctor/models/disease_post.dart';
import 'package:record_doctor/models/medicine.dart';

class DiseaseBloc extends Bloc<DiseaseEvent, DiseaseState> {
  DiseaseBloc(DiseaseState initialState) : super(initialState);
  TextFormField textFormField;
  bool isSymptom;
  List<Medicine> medicationsForDisease;
  @override
  Stream<DiseaseState> mapEventToState(
    DiseaseEvent event,
  ) async* {
    if (event is InitialDiseaseEvent) {
      yield LoadingMedicineDiseaseState();
      medicationsForDisease = await RecordDoctorApi().getMedications();
      yield LoadedSucessMedicineDiseaseState(
          medicationsForDisease: medicationsForDisease);
    }
    if (event is AddFieldInfoDiseaseEvent) {
      isSymptom = event.helperTextField == "Outro sintoma";

      textFormField = TextFormField(
        controller: TextEditingController(),
        decoration: InputDecoration(labelText: event.helperTextField),
      );
      yield LoadedFieldSymptomState(field: textFormField, isSymptom: isSymptom);
    }

    if (event is CreateNewDiseaseButtonPressedEvent) {
      yield LoadingProcessCreateDiseaseState();
      DiseasePost diseasePost = DiseasePost(
        name: event.nameDisease,
        symptoms: event.namesSymptoms,
        medicines: event.idsMedications,
      );
      bool response = await RecordDoctorApi().createDisease(diseasePost);
      if (response) {
        yield ProcessCreateSucessDiseaseState();
      } else {
        yield ProcessCreateFailedDiseaseState();
      }
    }
  }
}
