import 'package:final_wala_final_pka/models/data.dart';
import 'package:final_wala_final_pka/provider/changeColor.dart';
import 'package:final_wala_final_pka/screens/DrawerScreen/drawerScreen.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenAttempt2 extends StatefulWidget {
  @override
  _HomeScreenAttempt2State createState() => _HomeScreenAttempt2State();
}

class _HomeScreenAttempt2State extends State<HomeScreenAttempt2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            DrawerScreentype2(),
            //DrawerScreen(), // this will be the drawer thing
            //HomeScreenAttempt2(foodCategoryTypeLocal : foodCategoryType),  // This will contain all the code of the widget for the home page
            HomeScreenType2(),
          ],
        )
    );
  }
}
