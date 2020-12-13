import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class InitialStateHome extends HomeState {
  @override
  List<Object> get props => throw UnimplementedError();
}
