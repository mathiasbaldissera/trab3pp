import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:record_doctor/constants/constant_routes.dart';
import 'package:record_doctor/feature_modules/home/components/circle_home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xFF3BA8AA),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50, left: 50, right: 50),
            child: Container(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        // color: Color(0xFF01386D),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF01386D), Color(0xFF627FBC)]),
                        borderRadius: BorderRadius.only(
                            // Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        border: Border.all(color: Colors.white, width: 2)),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 20),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                          ),
                          Text(
                            "Bem-vindo ao",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          Text(
                            "Sistema de Prontuários Médico",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleHome(
                        heigth: 200,
                        width: 200,
                        title: "Cadastro de Paciente",
                        icon: Image.asset(
                          "assets/icon-patient.png",
                          color: Colors.white,
                          height: 50,
                        ),
                        function: () {
                          Navigator.pushNamed(context, PatientRouteNavigator);
                        },
                      ),
                      CircleHome(
                        heigth: 200,
                        width: 200,
                        title: "Cadastro de Medicamentos",
                        icon: Image.asset(
                          "assets/medic.png",
                          height: 50,
                          color: Colors.white,
                        ),
                        function: () {
                          Navigator.pushNamed(
                              context, MedicationRouteNavigator);
                        },
                      ),
                      CircleHome(
                        heigth: 200,
                        width: 200,
                        title: "Cadastro de Doenças",
                        icon: SvgPicture.asset(
                          "assets/people_sic.svg",
                          height: 50,
                          color: Colors.white,
                        ),
                        function: () {
                          Navigator.pushNamed(context, DiseaseRouteNavigator);
                        },
                      ),
                      CircleHome(
                        heigth: 200,
                        width: 200,
                        title: "Cadastro de Consultas",
                        icon: Icon(
                          Icons.list_alt_outlined,
                          size: 55,
                          color: Colors.white,
                        ),
                        function: () {
                          Navigator.pushNamed(
                              context, MedicalAppointmentRouteNavigator);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
