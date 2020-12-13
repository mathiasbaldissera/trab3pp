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

  int age;
  @override
  Stream<PatientState> mapEventToState(
    PatientEvent event,
  ) async* {
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
  }

  @override
  Stream<PatientState> mapEventToStateCheckButton(
    PatientEvent event,
  ) async* {
    if (event is ControlCheckPressedEvent) {}
  }

  navigatorPopInitPage(BuildContext context) {
    Navigator.pop(context);
  }

  _controllerCheckM(bool value) {
    if (!value && !checkF) {
      checkM = value;
      sex = "MASCULINO";
    } else {
      checkM = value;
      checkF = !checkM;
      sex = "MASCULINO";
    }
  }

  _controllerCheckF(bool value) {
    if (!value && !checkM) {
      checkF = value;
      sex = "FEMININO";
    } else {
      checkF = value;
      checkM = !checkF;
      sex = "FEMININO";
    }
  }

  _acceptNumber(String value, FocusNode focusNode) {
    try {
      if (value.isNotEmpty) {
        age = int.parse(value);
      }
      focusNode.addListener(() {
        if (!focusNode.hasFocus) {
          controllerTextAge = "$age";
        }
      });
    } catch (_) {
      controllerTextAge = "";
    }
  }
}
