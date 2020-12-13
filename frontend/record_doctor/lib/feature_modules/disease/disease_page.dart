import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record_doctor/communs/bottom_navigation_commun.dart';
import 'package:record_doctor/constants/constant_strings.dart';
import 'package:record_doctor/feature_modules/disease/bloc/disease_bloc.dart';
import 'package:record_doctor/feature_modules/disease/bloc/disease_event.dart';
import 'package:record_doctor/feature_modules/disease/bloc/disease_state.dart';
import 'package:record_doctor/feature_modules/disease/disease_form.dart';
import 'package:record_doctor/models/disease.dart';
import 'package:record_doctor/models/medicine.dart';

class DiseasePage extends StatefulWidget {
  @override
  _DiseasePageState createState() => _DiseasePageState();
}

class _DiseasePageState extends State<DiseasePage> {
  List<TextFormField> fieldsInfoSymptom = [];
  List<TextFormField> fieldsInfoMedication = [];
  List<Medicine> medicationsForDisease = [];
  List<String> namesSymptoms = [];
  List<Medicines> idsMedications = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final nameDiseaseController = TextEditingController();
  final nameSymptomFirstController = TextEditingController();
  var _blocDisease;
  @override
  void initState() {
    super.initState();
    _blocDisease = BlocProvider.of<DiseaseBloc>(context);
  }

  _createNewDisease() {
    print("sintomas ${namesSymptoms.toString()}");
    namesSymptoms.add(nameSymptomFirstController.text);
    for (var item in fieldsInfoSymptom) {
      namesSymptoms.add(item.controller.text);
    }
    _blocDisease.add(CreateNewDiseaseButtonPressedEvent(
        nameDisease: nameDiseaseController.text,
        idsMedications: idsMedications,
        namesSymptoms: namesSymptoms));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DiseaseBloc, DiseaseState>(
      listener: (context, state) {
        if (state is LoadingMedicineDiseaseState) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Row(
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    width: 30,
                  ),
                  Text("Buscando Remédios Cadastrados"),
                ],
              ),
            ),
          );
        }
        if (state is LoadingProcessCreateDiseaseState) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Row(
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    width: 30,
                  ),
                  Text("Seus dados estão sendo cadastrados..."),
                ],
              ),
            ),
          );
        }
        if (state is ProcessCreateFailedDiseaseState) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Row(
                children: <Widget>[
                  Text("Não foi possível salvar seus dados. Tente novamente!!"),
                ],
              ),
            ),
          );
        }
        if (state is ProcessCreateSucessDiseaseState) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Row(
                children: <Widget>[
                  Text("Seus dados foram cadastrados com sucesso!!"),
                ],
              ),
            ),
          );
        }
        if (state is LoadedSucessMedicineDiseaseState) {
          setState(() {
            medicationsForDisease = state.medicationsForDisease;
          });
        }
        if (state is LoadedFieldSymptomState) {
          if (state.isSymptom)
            setState(() {
              fieldsInfoSymptom.add(state.field);
            });
          else
            setState(() {
              fieldsInfoMedication.add(state.field);
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
                child: DiseaseForm(
                  fieldsInfoSymptom: fieldsInfoSymptom,
                  fieldsInfoMedication: fieldsInfoMedication,
                  medicationsForDisease: medicationsForDisease,
                  nameDiseaseController: nameDiseaseController,
                  nameSymptomFirst: nameSymptomFirstController,
                  idsMedications: idsMedications,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: BottomCommun(
          functionSave: _createNewDisease,
        ),
      ),
    );
  }
}
