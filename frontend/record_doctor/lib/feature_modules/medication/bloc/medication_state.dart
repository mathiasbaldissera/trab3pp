import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class MedicationState extends Equatable {
  const MedicationState();
}

class InitialStateMedication extends MedicationState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class LoadedListFunctionsMedicationState extends MedicationState {
  final TextFormField field;
  LoadedListFunctionsMedicationState({this.field});

  @override
  List<Object> get props => [field];
}

class LoadingProcessCreateMedicationState extends MedicationState {
  @override
  List<Object> get props => [];
}

class CreatedSucessMedicationState extends MedicationState {
  @override
  List<Object> get props => [];
}

class CreatedFailedMedicationState extends MedicationState {
  @override
  List<Object> get props => [];
}
