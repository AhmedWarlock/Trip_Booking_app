import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/constants/const.dart';
import 'package:trips/logic/cubit/app_cubit.dart';
import 'package:trips/presentation/widgets/widgets.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int numOfPeople = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        Details tripDetails = state as Details;

        return Scaffold(
          body: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'http://mark.bslmeiyu.com/uploads/' +
                                tripDetails.trip.img),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              Positioned(
                left: 10,
                top: 40,
                child: IconButton(
                    onPressed: () {
                      BlocProvider.of<AppCubit>(context).goHome();
                    },
                    icon: const Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.white,
                      size: 35,
                    )),
              ),
              Positioned(
                top: 270,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  width: MediaQuery.maybeOf(context)!.size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      color: Colors.white),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: tripDetails.trip.name,
                              fontWeight: FontWeight.bold,
                              size: 30,
                            ),
                            AppText(
                              text: '\$ ' + tripDetails.trip.price.toString(),
                              size: 21,
                              color: AppColors.mainColor,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            AppText(
                              text: ' ' + tripDetails.trip.location,
                              color: AppColors.mainColor,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  color: index < tripDetails.trip.stars
                                      ? AppColors.starColor
                                      : AppColors.textColor2,
                                );
                              }),
                            ),
                            AppText(
                              text: '  (${tripDetails.trip.stars}.0)',
                              color: AppColors.textColor1,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // People Text
                        AppText(
                            text: 'People',
                            size: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.8)),
                        const SizedBox(
                          height: 5,
                        ),
                        AppText(
                            text: 'Number of People in your group',
                            color: AppColors.mainTextColor),
                        const SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  numOfPeople = index;
                                });
                              },
                              child: AppButtons(
                                color: index == numOfPeople
                                    ? Colors.white
                                    : Colors.black,
                                backgroundcolor: index == numOfPeople
                                    ? Colors.black87
                                    : AppColors.buttonBackground,
                                bordercolor: index == numOfPeople
                                    ? Colors.black87
                                    : AppColors.buttonBackground,
                                size: 50,
                                text: (index + 1).toString(),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // Describtion Text
                        AppLargeText(
                          text: 'Describtion',
                          size: 20,
                          color: Colors.black.withOpacity(0.8),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: tripDetails.trip.description,
                          color: AppColors.textColor2,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            AppButtons(
                              color: AppColors.mainColor,
                              backgroundcolor: Colors.white,
                              bordercolor: AppColors.mainColor,
                              size: 50,
                              isIcon: true,
                              icon: Icons.favorite_border,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const SizedBox(
                              width: 270,
                              child: ResponsiveButton(
                                width: 250,
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
