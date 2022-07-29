import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/constants/const.dart';
import 'package:trips/logic/cubit/app_cubit.dart';
import 'package:trips/presentation/screens/export.dart';

class StateDetect extends StatefulWidget {
  const StateDetect({Key? key}) : super(key: key);

  @override
  _StateDetectState createState() => _StateDetectState();
}

class _StateDetectState extends State<StateDetect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
        if (state is WelcomeState) {
          return const WelcomePage();
        } else if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.mainColor,
            ),
          );
        } else if (state is LoadedState) {
          return const MainPage();
        } else if (state is Details) {
          return const DetailsPage();
        } else {
          return Container();
        }
      }),
    );
  }
}
