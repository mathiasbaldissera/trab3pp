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
