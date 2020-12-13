import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record_doctor/constants/constant_strings.dart' as labels;
import 'package:record_doctor/feature_modules/medication/bloc/medication_bloc.dart';
import 'package:record_doctor/feature_modules/medication/bloc/medication_event.dart';

class MedicationForm extends StatefulWidget {
  final List<TextFormField> fieldsMedications;
  final TextEditingController controllerName;
  final TextEditingController controllerFirstFunction;
  const MedicationForm(
      {this.fieldsMedications,
      this.controllerName,
      this.controllerFirstFunction});

  @override
  _MedicationFormState createState() => _MedicationFormState();
}

class _MedicationFormState extends State<MedicationForm> {
  var _blocMedication;
  @override
  void initState() {
    super.initState();
    _blocMedication = BlocProvider.of<MedicationBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _addMoreInfoMedication() {
      _blocMedication.add(AddMoreFunctionMedication());
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      child: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            leading: Icon(Icons.list_alt_outlined),
            title: Text(labels.labelItemTwoDrawer),
            subtitle: Text(labels.labelSubtitleCreateMedication),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50, top: 50),
                    child: TextFormField(
                      controller: widget.controllerName,
                      decoration:
                          InputDecoration(labelText: "Nome do medicamento"),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 350,
                        child: TextFormField(
                          controller: widget.controllerFirstFunction,
                          decoration: InputDecoration(
                              labelText: "Função do medicamento"),
                        ),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: _addMoreInfoMedication,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                              ),
                              child: Icon(Icons.add),
                            ),
                          ),
                          Text("Adicione mais funções"),
                        ],
                      ),
                    ],
                  ),
                  for (var item in widget.fieldsMedications) item,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
