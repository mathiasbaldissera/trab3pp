import 'package:equatable/equatable.dart';

abstract class MedicationEvent extends Equatable {
  const MedicationEvent();
}

class InitialMedicationEvent extends MedicationEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}

class AddMoreFunctionMedication extends MedicationEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}

class CreateNewMedicationEvent extends MedicationEvent {
  final String name;
  final List<String> functionsMedication;

  CreateNewMedicationEvent({this.name, this.functionsMedication});
  @override
  List<Object> get props => [name, functionsMedication];
}
