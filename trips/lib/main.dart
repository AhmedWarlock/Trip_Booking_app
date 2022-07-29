import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/data_layer/trip_data_model.dart';
import 'package:trips/logic/cubit/app_cubit.dart';
import 'package:trips/presentation/screens/export.dart';
import 'package:trips/presentation/state_detector.dart';

void main() async {
  TripAPI tripAPI = TripAPI();
  await tripAPI.getInfo();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit(tripAPI: TripAPI()),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const WelcomePage(),
          'mainpage': (context) => const MainPage(),
          'searchpage': (context) => const SearchPage(),
          'mypage': (context) => const MyPage(),
          'baritem': (context) => const BarItemPage(),
          'details': (context) => const DetailsPage(),
          'detect': (context) => const StateDetect(),
        },
        initialRoute: 'detect',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
