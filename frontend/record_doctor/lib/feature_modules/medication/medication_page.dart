import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record_doctor/communs/bottom_navigation_commun.dart';
import 'package:record_doctor/communs/colorPrimary.dart';
import 'package:record_doctor/constants/constant_strings.dart' as labels;
import 'package:record_doctor/feature_modules/medication/bloc/medication_bloc.dart';
import 'package:record_doctor/feature_modules/medication/bloc/medication_event.dart';
import 'package:record_doctor/feature_modules/medication/bloc/medication_state.dart';
import 'package:record_doctor/feature_modules/medication/components/medication_form.dart';
import 'package:record_doctor/feature_modules/patient_area/patient/patient_state.dart';

class MedicationPage extends StatefulWidget {
  @override
  _MedicationPageState createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> {
  var _blocMedication;
  var _nameMedicationController = TextEditingController();
  var _firstFunctionMedicationController = TextEditingController();
  List<String> _functionsMedication = [];
  @override
  void initState() {
    _blocMedication = BlocProvider.of<MedicationBloc>(context);
    super.initState();
  }

  List<TextFormField> fields = [];

  _createNewMedication() {
    _functionsMedication.add(_firstFunctionMedicationController.text);
    for (var field in fields) {
      _functionsMedication.add(field.controller.text);
    }
    _blocMedication.add(CreateNewMedicationEvent(
        name: _nameMedicationController.text,
        functionsMedication: _functionsMedication));
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<MedicationBloc, MedicationState>(
      listener: (context, state) {
        if (state is LoadedListFunctionsMedicationState) {
          setState(() {
            fields.add(state.field);
          });
        }
        if (state is LoadingProcessCreateMedicationState) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Row(
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    width: 30,
                  ),
                  Text("O remédio está sendo cadastrado..."),
                ],
              ),
            ),
          );
        }
        if (state is CreatedSucessMedicationState) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              backgroundColor: PrimaryColor().getColor(),
              content: Row(
                children: <Widget>[
                  Text("O remédio foi cadastrado com sucesso!"),
                ],
              ),
            ),
          );
        }
        if (state is CreatedFailedMedicationState) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              backgroundColor: Color(0xFFBB0000),
              content: Row(
                children: <Widget>[
                  Text("Algo de errado aconteceu. Tente novamente"),
                ],
              ),
            ),
          );
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(labels.labelCreatePatient),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: MedicationForm(
                  fieldsMedications: fields,
                  controllerName: _nameMedicationController,
                  controllerFirstFunction: _firstFunctionMedicationController,
                ),
              )
            ],
          ),
        ),
        floatingActionButton: BottomCommun(
          functionSave: _createNewMedication,
        ),
      ),
    );
  }
}
