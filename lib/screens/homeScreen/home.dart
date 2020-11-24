import 'package:final_wala_final_pka/models/data.dart';
import 'package:final_wala_final_pka/provider/changeColor.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'localWidgets/drawerScreen.dart';
import 'localWidgets/homeScreenAttempt2.dart';
import 'localWidgets/homeScreenPage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          DrawerScreen(), // this will be the drawer thing
          //HomeScreenAttempt2(foodCategoryTypeLocal : foodCategoryType),  // This will contain all the code of the widget for the home page
          HomeScreenType2(),
        ],
      )
    );
  }
}
