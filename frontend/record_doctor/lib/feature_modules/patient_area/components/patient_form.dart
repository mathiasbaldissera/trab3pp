import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record_doctor/feature_modules/patient_area/patient/patient_bloc.dart';
import 'package:record_doctor/feature_modules/patient_area/patient/patient_event.dart';
import 'package:record_doctor/feature_modules/patient_area/patient/patient_state.dart';

class PatientForm extends StatefulWidget {
  final TextEditingController nameController;
  TextEditingController ageController;
  final TextEditingController sexController;

  PatientForm({this.nameController, this.ageController, this.sexController});
  @override
  _PatientFormState createState() => _PatientFormState();
}

class _PatientFormState extends State<PatientForm> {
  FocusNode focusNode;

  bool checkM = false;

  bool checkF = false;
  int age = 0;
  var _blocPatient;

  @override
  void initState() {
    super.initState();
    focusNode = new FocusNode();
    _blocPatient = BlocProvider.of<PatientBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controllerCheckM(bool value) async {
      _blocPatient.add(ControlCheckMalePressedEvent(value: value));
    }

    _controllerCheckF(bool value) async {
      _blocPatient.add(ControlCheckFemalePressedEvent(value: value));
    }

    _controllChangedInputAge(String value) async {
      _blocPatient
          .add(ControllAgeChangedEvent(value: value, focusNode: focusNode));
    }

    return BlocListener<PatientBloc, PatientState>(
      listener: (context, state) {
        if (state is UpdateCheckControllMaleState) {
          setState(() {
            checkM = state.checkM;
            checkF = state.checkF;
            widget.sexController.text = state.sex;
          });
        }
        if (state is UpdateCheckControllFemaleState) {
          setState(() {
            checkM = state.checkM;
            checkF = state.checkF;
            widget.sexController.text = state.sex;
          });
        }
        if (state is ValueIsNumberState) {
          setState(() {
            age = state.age;
          });
        }
        if (state is ValueIsNotNumberState) {
          setState(() {
            FocusScope.of(context).requestFocus(new FocusNode());
            widget.ageController.text = state.value;
          });
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.55,
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Nome do Paciente"),
                controller: widget.nameController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Idade do Paciente"),
                controller: widget.ageController,
                // focusNode: focusNode,
                onChanged: (value) {
                  _controllChangedInputAge(value);
                  // try {
                  //   if (value.isNotEmpty) {
                  //     age = int.parse(value);
                  //   }
                  //   focusNode.addListener(() {
                  //     if (!focusNode.hasFocus) {
                  //       widget.ageController.text = "$age";
                  //     }
                  //   });
                  // } catch (_) {
                  //   setState(() {
                  //     widget.ageController.text = "";
                  //   });
                  // }
                },
              ),
              Row(
                children: [
                  Checkbox(
                    value: checkM,
                    onChanged: (value) {
                      _controllerCheckM(value);
                    },
                  ),
                  Text("Masculino"),
                  Checkbox(
                    value: checkF,
                    onChanged: (value) {
                      _controllerCheckF(value);
                    },
                  ),
                  Text("Feminino"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
