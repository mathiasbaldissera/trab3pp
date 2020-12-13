import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:record_doctor/feature_modules/home/bloc/home_event.dart';
import 'package:record_doctor/feature_modules/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState);

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {}
}
