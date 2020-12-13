import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record_doctor/feature_modules/home/bloc/home_bloc.dart';
import 'package:record_doctor/feature_modules/home/bloc/home_state.dart';
import 'package:record_doctor/feature_modules/home/home_page.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) => HomeBloc(InitialStateHome()),
      child: HomePage(),
    );
  }
}
