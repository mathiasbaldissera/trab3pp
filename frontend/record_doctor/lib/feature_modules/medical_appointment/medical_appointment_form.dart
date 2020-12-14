import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record_doctor/communs/colorPrimary.dart';
import 'package:record_doctor/communs/fields_commun.dart';
import 'package:record_doctor/constants/constant_strings.dart' as labels;
import 'package:record_doctor/feature_modules/medical_appointment/bloc/medical_appointment_bloc.dart';
import 'package:record_doctor/feature_modules/medical_appointment/bloc/medical_appointment_event.dart';
import 'package:record_doctor/models/medicine.dart';
import 'package:record_doctor/models/patient.dart';
import 'package:record_doctor/models/possible_disease.dart';
import 'package:record_doctor/models/sex.dart';

class MedicalAppointmentForm extends StatefulWidget {
  final List<Patient> listPatient;
  final List<TextFormField> fieldsInfoSymptom;
  final TextEditingController nameDiseaseController;
  final List<PossibleDisease> possibleDisease;
  const MedicalAppointmentForm(
      {this.listPatient,
      this.fieldsInfoSymptom,
      this.nameDiseaseController,
      this.possibleDisease});

  @override
  _MedicalAppointmentFormState createState() => _MedicalAppointmentFormState();
}

class _MedicalAppointmentFormState extends State<MedicalAppointmentForm> {
  var _blocAppointment;
  List<String> symptoms = [];
  @override
  void initState() {
    _blocAppointment = BlocProvider.of<MedicalAppointmentBloc>(context);
    super.initState();
  }

  _addMoreInfoDisease() {
    _blocAppointment.add(AddFieldInfoMedicalAppointmentEvent(
        helperTextField: labels.labelMoreFieldsSymptom));
  }

  _gerateDiagnosisMedicalAppointment() {
    symptoms.clear();
    symptoms.add(widget.nameDiseaseController.text);
    if (widget.fieldsInfoSymptom != null) {
      for (var item in widget.fieldsInfoSymptom) {
        symptoms.add(item.controller.text);
      }
    }
    _blocAppointment
        .add(GerateDiagnosisMedicalAppointmentEvent(symptoms: symptoms));
  }

  String _getStringToList(List<Medicine> medicines) {
    var names = StringBuffer();
    String namesMedicines;
    if (medicines.length > 1) {
      medicines.forEach((element) {
        names.write(element.name + ", ");
      });
      namesMedicines = names.toString();
    } else {
      namesMedicines = medicines[0].name;
    }
    return namesMedicines;
  }

  Patient _selectedPatient;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListTile(
                          title: Text(labels.labelCreateAppointment),
                          subtitle: Text(labels.labelCreateAppointmentSubtitle),
                          leading: Icon(Icons.list_alt_outlined),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: DropdownButtonFormField<Patient>(
                                      items: widget.listPatient
                                          .map((Patient value) {
                                        return DropdownMenuItem<Patient>(
                                          value: value,
                                          child: Container(
                                            child: Text(value.name),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedPatient = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text("Informações do Paciente:"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                  ),
                                  child: Row(
                                    children: [
                                      Text("Nome do paciente: "),
                                      Text(_selectedPatient == null
                                          ? ""
                                          : _selectedPatient.name),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 20),
                                  child: Row(
                                    children: [
                                      Text("Idade do paciente: "),
                                      Text(_selectedPatient == null
                                          ? ""
                                          : "${_selectedPatient.age}"),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 20),
                                  child: Row(
                                    children: [
                                      Text("Sexo do paciente: "),
                                      Text(_selectedPatient == null
                                          ? ""
                                          : (_selectedPatient.sex == Sex.MALE
                                              ? "Masculino"
                                              : "Feminino")),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, right: 30),
                          child: FieldsCommun(
                            function: _addMoreInfoDisease,
                            labelText: labels.labelFieldSymptom,
                            labelTextSubField: labels.buttonAddMoreSymptom,
                            valueSize: MediaQuery.of(context).size.width * 0.75,
                            nameSymptomController: widget.nameDiseaseController,
                          ),
                        ),
                        for (var item in widget.fieldsInfoSymptom)
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 30.0,
                              right: 300,
                            ),
                            child: item,
                          ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 50,
                                  child: RaisedButton.icon(
                                    textColor: Colors.white,
                                    color: PrimaryColor().getColor(),
                                    onPressed: () {
                                      _gerateDiagnosisMedicalAppointment();
                                    },
                                    icon: Icon(Icons.lightbulb, size: 20),
                                    label: Text("Gerar possíveis diagnósticos"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    color: PrimaryColor().getColor(),
                    elevation: 5,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("Possíveis Diagnósticos",
                              style: TextStyle(color: Colors.white)),
                          subtitle: Text(
                              "Os diagnósticos serão mostrados após o preenchimentos do formulário de prontuário.",
                              style: TextStyle(color: Colors.white)),
                          leading: Icon(
                            Icons.lightbulb_outline,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: widget.possibleDisease.map((item) {
                                return CheckboxListTile(
                                  activeColor: Colors.black,
                                  title: Text(
                                    "Nome da Doença: ${item.name}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                      "Remédios para tratamento: ${_getStringToList(item.medicines)}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  value: false,
                                  onChanged: (bool value) {
                                    setState(() {});
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF007376),
                              border: Border.all(width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  widget.fieldsInfoSymptom.clear();
                                });
                              },
                              title: Text(
                                "Limpe os campos para gerar novo diagnóstico.",
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                "Apenas clique nesta opção e os campos de sintomas serão limpados.",
                                style: TextStyle(color: Colors.white),
                              ),
                              leading: Icon(
                                Icons.sync_sharp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
