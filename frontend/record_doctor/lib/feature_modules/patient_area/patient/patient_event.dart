import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class PatientEvent extends Equatable {
  const PatientEvent();
}

class InitialPatientEvent extends PatientEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}

class CreatePatientButtonPressedEvent extends PatientEvent {
  final String name;
  final int age;
  final String sex;
  final BuildContext context;
  CreatePatientButtonPressedEvent(
      {this.context, this.name, this.age, this.sex});
  @override
  List<Object> get props => [name, age, sex, context];
}

class ControlCheckPressedEvent extends PatientEvent {
  @override
  List<Object> get props => [];
}
