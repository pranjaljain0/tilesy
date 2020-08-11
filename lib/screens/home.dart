import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:tilesy/Constants.dart';
import 'package:tilesy/screens/HomeTabScreens/AboutTab.dart';
import 'package:tilesy/screens/HomeTabScreens/CatTab.dart';
import 'package:tilesy/screens/HomeTabScreens/homeTab.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 1;
  List<Widget> tabs = [CatTab(), HomeTab(), AboutTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentPage],
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: secondaryColor,
        inactiveIconColor: secondaryColor,
        initialSelection: 1,
        tabs: [
          TabData(iconData: Icons.account_balance, title: "Categories"),
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.person, title: "About")
        ],
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }
}
