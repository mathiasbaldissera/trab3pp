import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:record_doctor/models/medicine.dart';

abstract class DiseaseState extends Equatable {
  const DiseaseState();
}

class InitialStateDisease extends DiseaseState {
  @override
  List<Object> get props => [];
}

class LoadedFieldSymptomState extends DiseaseState {
  final TextFormField field;
  final isSymptom;
  LoadedFieldSymptomState({this.isSymptom, this.field});
  @override
  List<Object> get props => [field, isSymptom];
}

class LoadingMedicineDiseaseState extends DiseaseState {
  @override
  List<Object> get props => [];
}

class LoadedSucessMedicineDiseaseState extends DiseaseState {
  final List<Medicine> medicationsForDisease;

  LoadedSucessMedicineDiseaseState({this.medicationsForDisease});
  @override
  List<Object> get props => [medicationsForDisease];
}

class LoadingProcessCreateDiseaseState extends DiseaseState {
  @override
  List<Object> get props => [];
}

class ProcessCreateSucessDiseaseState extends DiseaseState {
  @override
  List<Object> get props => [];
}

class ProcessCreateFailedDiseaseState extends DiseaseState {
  @override
  List<Object> get props => [];
}
