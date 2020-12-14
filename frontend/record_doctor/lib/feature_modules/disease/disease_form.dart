import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record_doctor/communs/fields_commun.dart';
import 'package:record_doctor/constants/constant_strings.dart' as labels;
import 'package:record_doctor/feature_modules/disease/bloc/disease_bloc.dart';
import 'package:record_doctor/feature_modules/disease/bloc/disease_event.dart';
import 'package:record_doctor/models/disease.dart';
import 'package:record_doctor/models/medicine.dart';

class DiseaseForm extends StatefulWidget {
  final List<TextFormField> fieldsInfoSymptom;
  final List<TextFormField> fieldsInfoMedication;
  final List<Medicine> medicationsForDisease;
  final TextEditingController nameDiseaseController;
  final TextEditingController nameSymptomFirst;
  final List<Medicines> idsMedications;
  const DiseaseForm(
      {this.fieldsInfoSymptom,
      this.fieldsInfoMedication,
      this.medicationsForDisease,
      this.nameDiseaseController,
      this.idsMedications,
      this.nameSymptomFirst});
  @override
  _DiseaseFormState createState() => _DiseaseFormState();
}

class _DiseaseFormState extends State<DiseaseForm> {
  var _blocDisease;
  List<Medicine> _medicationsSelected = [];
  Medicine _selectedMedication;
  @override
  void initState() {
    _blocDisease = BlocProvider.of<DiseaseBloc>(context);
    super.initState();
  }

  _addMoreInfoDisease() {
    _blocDisease.add(AddFieldInfoDiseaseEvent(
        helperTextField: labels.labelMoreFieldsSymptom));
  }

  _addSymptoms(Medicine value) {
    if (value != null) {
      Medicines medicines = Medicines(id: value.id);
      setState(() {
        _medicationsSelected.add(value);
        widget.idsMedications.add(medicines);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            leading: Icon(Icons.list_alt_outlined),
            title: Text(labels.labelItemThreeDrawer),
            subtitle: Text(labels.labelSubtitleCreateDisease),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50, top: 50),
                    child: TextFormField(
                      controller: widget.nameDiseaseController,
                      decoration: InputDecoration(labelText: "Nome da doença"),
                    ),
                  ),
                  FieldsCommun(
                    function: _addMoreInfoDisease,
                    labelText: labels.labelFieldSymptom,
                    labelTextSubField: labels.buttonAddMoreSymptom,
                    nameSymptomController: widget.nameSymptomFirst,
                  ),
                  for (var item in widget.fieldsInfoSymptom) item,
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 60.0, bottom: 30.0, right: 300),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF007376),
                        border: Border.all(width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            widget.fieldsInfoSymptom.clear();
                          });
                        },
                        title: Text(
                          "Limpar campos de sintomas adicionais.",
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 152,
                              child: DropdownButtonFormField<Medicine>(
                                items: widget.medicationsForDisease
                                    .map((Medicine value) {
                                  return DropdownMenuItem<Medicine>(
                                    value: value,
                                    child: Container(
                                      child: Text(value.name),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedMedication = value;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, left: 95),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _addSymptoms(_selectedMedication);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                      ),
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                  Text("Adicionar remédio"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Card(
                      elevation: 10,
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Icon(Icons.list),
                            title: Text("Remédios Adicionados"),
                          ),
                          for (var item in _medicationsSelected)
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 15),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 200,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(Icons.dangerous),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Text(item.name),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _medicationsSelected.remove(item);
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.restore_from_trash,
                                          ),
                                          Text("Remover")
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 150,
          ),
        ],
      ),
    );
  }
}
