import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:record_doctor/models/possible_disease.dart';
import 'package:record_doctor/models/patient.dart';

abstract class MedicalAppointmentState extends Equatable {
  const MedicalAppointmentState();
}

class InitialStateMedicalAppointment extends MedicalAppointmentState {
  @override
  List<Object> get props => [];
}

class LoadingDataState extends MedicalAppointmentState {
  @override
  List<Object> get props => [];
}

class LoadedDiagnosisPossibleState extends MedicalAppointmentState {
  final List<PossibleDisease> possibleDisease;

  LoadedDiagnosisPossibleState({this.possibleDisease});
  @override
  List<Object> get props => [possibleDisease];
}

class LoadedPatientsState extends MedicalAppointmentState {
  final List<Patient> patients;

  LoadedPatientsState({this.patients});
  @override
  List<Object> get props => [patients];
}

class LoadedFieldSymptomState extends MedicalAppointmentState {
  final TextFormField field;
  final isSymptom;
  LoadedFieldSymptomState({this.isSymptom, this.field});
  @override
  List<Object> get props => [field, isSymptom];
}
