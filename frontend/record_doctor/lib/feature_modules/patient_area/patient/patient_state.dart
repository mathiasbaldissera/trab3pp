import 'package:equatable/equatable.dart';

abstract class PatientState extends Equatable {
  const PatientState();
}

class InitialStatePatient extends PatientState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class LoadingActionCreatePatientState extends PatientState {
  @override
  List<Object> get props => [];
}

class CreatePatientSucessState extends PatientState {
  final Function navigatorPop;

  CreatePatientSucessState({this.navigatorPop});
  @override
  List<Object> get props => [navigatorPop];
}

class FailedCreatePatientState extends PatientState {
  @override
  List<Object> get props => [];
}

class UpdateCheckControllMaleState extends PatientState {
  final bool checkM;
  final bool checkF;
  final String sex;
  UpdateCheckControllMaleState({this.checkF, this.checkM, this.sex});
  @override
  List<Object> get props => [checkM, checkF, sex];
}

class UpdateCheckControllFemaleState extends PatientState {
  final bool checkM;
  final bool checkF;
  final String sex;
  UpdateCheckControllFemaleState({this.checkF, this.checkM, this.sex});
  @override
  List<Object> get props => [checkM, checkF, sex];
}

class ValueIsNumberState extends PatientState {
  final int age;
  ValueIsNumberState({this.age});
  @override
  List<Object> get props => [age];
}

class ValueIsNotNumberState extends PatientState {
  final String value = "";
  @override
  List<Object> get props => [];
}

class UpdateValueFieldAgeState extends PatientState {
  final String value;

  UpdateValueFieldAgeState({this.value});
  @override
  List<Object> get props => [value];
}
