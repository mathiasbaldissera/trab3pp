import 'package:equatable/equatable.dart';
import 'package:record_doctor/models/disease.dart';

abstract class DiseaseEvent extends Equatable {
  const DiseaseEvent();
}

class InitialDiseaseEvent extends DiseaseEvent {
  @override
  List<Object> get props => [];
}

class AddFieldInfoDiseaseEvent extends DiseaseEvent {
  final String helperTextField;

  AddFieldInfoDiseaseEvent({this.helperTextField});
  @override
  List<Object> get props => [helperTextField];
}

class CreateNewDiseaseButtonPressedEvent extends DiseaseEvent {
  final String nameDisease;
  final List<String> namesSymptoms;
  final List<Medicines> idsMedications;

  CreateNewDiseaseButtonPressedEvent(
      {this.nameDisease, this.namesSymptoms, this.idsMedications});
  @override
  List<Object> get props => [nameDisease, namesSymptoms, idsMedications];
}
