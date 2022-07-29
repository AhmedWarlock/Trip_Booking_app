import 'package:flutter/material.dart';
import 'package:trips/constants/const.dart';
import 'export.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = const [HomePage(), MyPage(), BarItemPage(), SearchPage()];
  int barIndex = 0;
  void onTap(int i) {
    setState(() {
      barIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[barIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: barIndex,
        onTap: onTap,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.black.withOpacity(0.5),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: 'My'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded), label: 'Bar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_sharp), label: 'Search'),
        ],
      ),
    );
  }
}
