import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trips/data_layer/trip_data_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final TripAPI tripAPI;
  late final places;

  AppCubit({required this.tripAPI}) : super(AppInitial()) {
    emit(WelcomeState());
  }

  void getData() async {
    emit(LoadingState());
    places = await tripAPI.getInfo();
    emit(LoadedState(places: places));
  }

  void getDetails(Trip trip) {
    emit(Details(trip: trip));
  }

  void goHome() => emit(LoadedState(places: places));
}
