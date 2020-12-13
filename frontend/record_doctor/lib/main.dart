import 'package:flutter/material.dart';
import 'package:record_doctor/communs/colorPrimary.dart';
import 'package:record_doctor/router.dart' as router;
import 'package:record_doctor/constants/constant_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prontuário Médico',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: PrimaryColor().getColor(),
      ),
      onGenerateRoute: router.generateRoute,
      initialRoute: HomeRouteNavigator,
    );
  }
}
