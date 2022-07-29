import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/constants/const.dart';
import 'package:trips/logic/cubit/app_cubit.dart';
import 'package:trips/presentation/widgets/widgets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/${images[index]}'),
              fit: BoxFit.cover,
            )),
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 100, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        text: 'Trip',
                        fontWeight: FontWeight.bold,
                        size: 30,
                      ),
                      const AppText(
                        text: 'Discover',
                        size: 24,
                        color: Colors.black54,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        width: 250,
                        child: AppText(
                          text: 'sdhfg sfjfhdfgs ksjdfhsg kjsdfh s',
                          color: AppColors.textColor2,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubit>(context).getData();
                        },
                        child: SizedBox(
                          width: 150,
                          child: AppButton(
                            width: 100,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(images.length, (dotindex) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        width: 12,
                        height: index == dotindex ? 40 : 10,
                        decoration: BoxDecoration(
                          color: index == dotindex
                              ? AppColors.mainColor
                              : AppColors.mainColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
