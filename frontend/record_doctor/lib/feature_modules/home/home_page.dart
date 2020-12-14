import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:record_doctor/communs/colorPrimary.dart';
import 'package:record_doctor/constants/constant_routes.dart';
import 'package:record_doctor/feature_modules/home/components/circle_home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: PrimaryColor().getColor()[600],
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50, left: 50, right: 50),
            child: Stack(
              children: [
                Positioned(
                  left: 250,
                  top: 50,
                  child: Image.asset("assets/hosp.png"),
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Sistema de Consultório Médico",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
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
                              Navigator.pushNamed(
                                  context, PatientRouteNavigator);
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
                              Navigator.pushNamed(
                                  context, DiseaseRouteNavigator);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
