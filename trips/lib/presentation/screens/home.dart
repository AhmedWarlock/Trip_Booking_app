import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/constants/const.dart';
import 'package:trips/logic/cubit/app_cubit.dart';
import 'package:trips/presentation/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (state is LoadedState) {
            var tripData = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.menu_rounded,
                        size: 50,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.mainColor.withOpacity(0.7),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // Discover Text
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: const AppText(
                    text: 'Discover',
                    fontWeight: FontWeight.bold,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // TabBar

                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: AppColors.mainColor,
                    isScrollable: true,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey[400],
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator:
                        TabBarIndicator(color: AppColors.mainColor, radius: 4),
                    tabs: [
                      const Tab(
                        text: 'Places',
                      ),
                      const Tab(
                        text: 'Inspiration',
                      ),
                      const Tab(
                        text: 'Emotions',
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 213,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                          itemCount: tripData.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                context
                                    .read<AppCubit>()
                                    .getDetails(tripData[index]);
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.only(right: 10, top: 5),
                                height: 213,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'http://mark.bslmeiyu.com/uploads/${tripData[index].img}'),
                                        fit: BoxFit.cover)),
                              ),
                            );
                          }),
                      const Text('There'),
                      const Text('Nye'),
                    ],
                  ),
                ),
                // Explore Text
                const SizedBox(
                  height: 25,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AppText(
                          text: 'Explore More',
                          fontWeight: FontWeight.bold,
                          size: 22,
                        ),
                        AppLargeText(
                          text: 'see all',
                          color: AppColors.textColor2,
                          size: 16,
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                // Explore List

                Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 120,
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: Column(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(right: 10, top: 5),
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage('images/' +
                                            activities.values.elementAt(index)),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: AppText(
                                  text: activities.keys.elementAt(index),
                                  color: AppColors.textColor2,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
