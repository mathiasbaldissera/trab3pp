import 'package:flutter/material.dart';

class PatientForm extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController sexController;

  const PatientForm(
      {this.nameController, this.ageController, this.sexController});
  @override
  _PatientFormState createState() => _PatientFormState();
}

class _PatientFormState extends State<PatientForm> {
  FocusNode focusNode;

  bool checkM = false;

  bool checkF = false;

  @override
  void initState() {
    super.initState();
    focusNode = new FocusNode();
  }

  int age = 0;
  _controllerCheckM(bool value) {
    setState(() {
      if (!value && !checkF) {
        checkM = value;
        widget.sexController.text = "MASCULINO";
      } else {
        checkM = value;
        checkF = !checkM;
        widget.sexController.text = "MASCULINO";
      }
    });
  }

  _controllerCheckF(bool value) {
    setState(() {
      if (!value && !checkM) {
        checkF = value;
        widget.sexController.text = "FEMININO";
      } else {
        checkF = value;
        checkM = !checkF;
        widget.sexController.text = "FEMININO";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              focusNode: focusNode,
              onChanged: (value) {
                try {
                  if (value.isNotEmpty) {
                    age = int.parse(value);
                  }
                  focusNode.addListener(() {
                    if (!focusNode.hasFocus) {
                      widget.ageController.text = "$age";
                    }
                  });
                } catch (_) {
                  setState(() {
                    widget.ageController.text = "";
                  });
                }
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
    );
  }
}
