import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record_doctor/feature_modules/disease/bloc/disease_bloc.dart';
import 'package:record_doctor/feature_modules/disease/bloc/disease_event.dart';
import 'package:record_doctor/feature_modules/disease/bloc/disease_state.dart';
import 'package:record_doctor/feature_modules/disease/disease_page.dart';

class DiseaseRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DiseaseBloc>(
      create: (BuildContext context) {
        var bloc = DiseaseBloc(InitialStateDisease());
        bloc.add(InitialDiseaseEvent());
        return bloc;
      },
      child: DiseasePage(),
    );
  }
}
