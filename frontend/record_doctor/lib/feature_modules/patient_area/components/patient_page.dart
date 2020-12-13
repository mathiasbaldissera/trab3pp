import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record_doctor/communs/bottom_navigation_commun.dart';
import 'package:record_doctor/communs/colorPrimary.dart';
import 'package:record_doctor/constants/constant_strings.dart' as labels;
import 'package:record_doctor/feature_modules/patient_area/patient/patient_bloc.dart';
import 'package:record_doctor/feature_modules/patient_area/patient/patient_event.dart';
import 'package:record_doctor/feature_modules/patient_area/patient/patient_state.dart';
import 'patient_form.dart';

class PatientPage extends StatefulWidget {
  @override
  _PatientPageState createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  var _blocPatient;
  @override
  void initState() {
    super.initState();
    _blocPatient = BlocProvider.of<PatientBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    final _nameController = TextEditingController();
    final _ageController = TextEditingController();
    final _sexController = TextEditingController();

    _createNewPatient() {
      _blocPatient.add(CreatePatientButtonPressedEvent(
          name: _nameController.text,
          age: int.parse(_ageController.text),
          sex: _sexController.text,
          context: context));
    }

    _cancelOperation() {
      Navigator.pop(context);
    }

    return BlocBuilder<PatientBloc, PatientState>(
      builder: (context, state) {
        if (state is LoadingActionCreatePatientState) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Row(
                children: <Widget>[
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
        }
        if (state is CreatePatientSucessState) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              backgroundColor: PrimaryColor().getColor(),
              content: Row(
                children: <Widget>[
                  Text("O paciente foi cadastrado com sucesso!"),
                ],
              ),
            ),
          );
        }
        if (state is FailedCreatePatientState) {
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
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(labels.labelCreatePatient),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Scrollbar(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          ListTile(
                            leading: Icon(Icons.account_box),
                            title: Text(labels.labelItemOneDrawer),
                            subtitle: Text(labels.labelSubtitleCreatePatient),
                          ),
                          PatientForm(
                            nameController: _nameController,
                            ageController: _ageController,
                            sexController: _sexController,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: BottomCommun(
            functionSave: _createNewPatient,
            functionCancel: _cancelOperation,
          ),
        );
      },
    );
  }
}
