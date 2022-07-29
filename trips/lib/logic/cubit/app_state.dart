part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {}

class WelcomeState extends AppState {}

class Details extends AppState {
  final Trip trip;

  const Details({required this.trip});
}

class LoadingState extends AppState {}

class LoadedState extends AppState {
  final List<Trip> places;

  const LoadedState({required this.places});
}
