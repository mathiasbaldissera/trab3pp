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

class ControlCheckMalePressedEvent extends PatientEvent {
  final bool value;

  ControlCheckMalePressedEvent({this.value});
  @override
  List<Object> get props => [value];
}

class ControlCheckFemalePressedEvent extends PatientEvent {
  final bool value;

  ControlCheckFemalePressedEvent({this.value});
  @override
  List<Object> get props => [value];
}

class ControllAgeChangedEvent extends PatientEvent {
  final String value;
  final FocusNode focusNode;
  ControllAgeChangedEvent({this.focusNode, this.value});
  @override
  List<Object> get props => [value, focusNode];
}
