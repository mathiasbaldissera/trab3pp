import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record_doctor/constants/constant_strings.dart';
import 'package:record_doctor/feature_modules/medical_appointment/bloc/medical_appointment_bloc.dart';
import 'package:record_doctor/feature_modules/medical_appointment/bloc/medical_appointment_event.dart';
import 'package:record_doctor/feature_modules/medical_appointment/bloc/medical_appointment_state.dart';
import 'package:record_doctor/feature_modules/medical_appointment/medical_appointment_form.dart';
import 'package:record_doctor/models/patient.dart';
import 'package:record_doctor/models/possible_disease.dart';

class MedicalAppointmentPage extends StatefulWidget {
  @override
  _MedicalAppointmentPageState createState() => _MedicalAppointmentPageState();
}

class _MedicalAppointmentPageState extends State<MedicalAppointmentPage> {
  var _blocMedicalAppointment;
  List<TextFormField> fieldsInfoSymptom = [];
  final nameDiseaseController = TextEditingController();
  List<PossibleDisease> possibleDisease = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Patient> listPatient = [];
  @override
  void initState() {
    _blocMedicalAppointment = BlocProvider.of<MedicalAppointmentBloc>(context);
    _blocMedicalAppointment.add(InitialMedicalAppointmentEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MedicalAppointmentBloc, MedicalAppointmentState>(
      listener: (context, state) {
        if (state is LoadingDataState) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Row(
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    width: 30,
                  ),
                  Text("Os dados estão sendo carregados."),
                ],
              ),
            ),
          );
        }
        if (state is LoadedPatientsState) {
          setState(() {
            listPatient = state.patients;
          });
        }
        if (state is LoadedFieldSymptomState) {
          setState(() {
            fieldsInfoSymptom.add(state.field);
          });
        }
        if (state is LoadedDiagnosisPossibleState) {
          possibleDisease.clear();
          setState(() {
            possibleDisease = state.possibleDisease;
          });
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(labelCreatePatient),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: MedicalAppointmentForm(
                  listPatient: listPatient,
                  fieldsInfoSymptom: fieldsInfoSymptom,
                  possibleDisease: possibleDisease,
                  nameDiseaseController: nameDiseaseController,
                ),
              ),
            ],
          ),
        ),
        // floatingActionButton: BottomCommun(),
      ),
    );
  }
}
