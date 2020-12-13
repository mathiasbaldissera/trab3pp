import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:record_doctor/api/record_doctor_api.dart';
import 'package:record_doctor/models/patient.dart';
import 'package:record_doctor/models/sex.dart';

import 'patient_state.dart';
import 'patient_event.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  PatientBloc(PatientState initialState) : super(initialState);

  bool checkM = false;

  bool checkF = false;

  String sex;

  String controllerTextAge;

  FocusNode focusNode;

  int age;
  @override
  Stream<PatientState> mapEventToState(
    PatientEvent event,
  ) async* {
    if (event is ControlCheckMalePressedEvent) {
      if (!event.value && !checkF) {
        checkM = event.value;
        sex = "MASCULINO";
        yield UpdateCheckControllMaleState(
            sex: sex, checkM: checkM, checkF: checkF);
      } else {
        checkM = event.value;
        checkF = !checkM;
        sex = "MASCULINO";
        yield UpdateCheckControllMaleState(
            sex: sex, checkM: checkM, checkF: checkF);
      }
    }
    if (event is ControlCheckFemalePressedEvent) {
      if (!event.value && !checkM) {
        checkF = event.value;
        sex = "FEMININO";
        yield UpdateCheckControllFemaleState(
            sex: sex, checkM: checkF, checkF: checkF);
      } else {
        checkF = event.value;
        checkM = !checkF;
        sex = "FEMININO";
        yield UpdateCheckControllFemaleState(
            sex: sex, checkM: checkM, checkF: checkF);
      }
    }
    if (event is CreatePatientButtonPressedEvent) {
      yield LoadingActionCreatePatientState();
      Patient patient;
      if (event.sex == "MASCULINO") {
        patient = Patient(name: event.name, age: event.age, sex: Sex.MALE);
      } else {
        patient = Patient(name: event.name, age: event.age, sex: Sex.FEMALE);
      }
      bool response = await RecordDoctorApi().createPatient(patient);
      if (response) {
        yield CreatePatientSucessState();
      } else {
        yield FailedCreatePatientState();
      }
    }
    if (event is ControllAgeChangedEvent) {
      try {
        if (event.value.isNotEmpty) {
          age = int.parse(event.value);
          yield ValueIsNumberState(age: age);
        }
      } catch (_) {
        print("deu exception");
        yield ValueIsNotNumberState();
      }
    }
  }

  navigatorPopInitPage(BuildContext context) {
    Navigator.pop(context);
  }
}
