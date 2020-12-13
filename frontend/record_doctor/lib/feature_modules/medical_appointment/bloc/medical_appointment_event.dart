import 'package:equatable/equatable.dart';

abstract class MedicalAppointmentEvent extends Equatable {
  const MedicalAppointmentEvent();
}

class InitialMedicalAppointmentEvent extends MedicalAppointmentEvent {
  @override
  List<Object> get props => [];
}

class GerateDiagnosisMedicalAppointmentEvent extends MedicalAppointmentEvent {
  final List<String> symptoms;

  GerateDiagnosisMedicalAppointmentEvent({this.symptoms});
  @override
  List<Object> get props => [symptoms];
}

class AddFieldInfoMedicalAppointmentEvent extends MedicalAppointmentEvent {
  final String helperTextField;

  AddFieldInfoMedicalAppointmentEvent({this.helperTextField});
  @override
  List<Object> get props => [helperTextField];
}
