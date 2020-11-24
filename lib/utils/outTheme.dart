import 'package:flutter/material.dart';

class OurTheme{
  //Color _orangish = Color(0XFFF59C16);
  Color _orangish = Color(0xFFF2BC57);
  Color _lightGrey = Color.fromARGB(255, 164, 164, 164);
  Color _darkGrey = Color.fromARGB(255, 119, 124, 135);
  Color _redColor = Color(0X720d5d);
  Color _gradientBlack = Colors.black54;
  Color _cartTheme = Color(0xFFF4e55af);
  List<BoxShadow> shadowList = [
    BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0,10)),
  ];

  // List<Gradient> appBackgroundGradient = [
  //   Gradient(
  //     colors: [
  //
  //     ]
  //   )
  // ]

  ThemeData buildTheme() {
    return ThemeData(
        canvasColor: _gradientBlack,
        //primaryColor: _orangish, // this is the color of the pages and some of the icons
        accentColor: _lightGrey,
        //secondaryHeaderColor: _gradientBlack,
        hintColor: _gradientBlack,
        //cardColor: _cartTheme,
        //cardColor: _cartTheme,
        //cardColor: Colors.white,
        // cardTheme: CardTheme(
        //   elevation: 100
        // ),

        // inputDecorationTheme: InputDecorationTheme(
        //   border: OutlineInputBorder(
        //       borderRadius: BorderRadius.only(
        //           topRight: Radius.circular(40.0),
        //           bottomRight: Radius.circular(40.0)
        //       ),
        //       borderSide: BorderSide(
        //         color: Colors.black,
        //       )
        //   ),
        //   focusedBorder: OutlineInputBorder(
        //       borderRadius: BorderRadius.only(
        //           topRight: Radius.circular(40.0),
        //           bottomRight: Radius.circular(40.0)
        //       ),
        //       borderSide: BorderSide(
        //           color: Colors.white
        //       )
        //   ),
        //   enabledBorder: OutlineInputBorder(
        //       borderRadius: BorderRadius.only(
        //           topRight: Radius.circular(40.0),
        //           bottomRight: Radius.circular(40.0)
        //       ),
        //       borderSide: BorderSide(
        //           color: Colors.white
        //       )
        //   ),
        //   disabledBorder: OutlineInputBorder(
        //       borderRadius: BorderRadius.only(
        //           topRight: Radius.circular(40.0),
        //           bottomRight: Radius.circular(40.0)
        //       ),
        //       borderSide: BorderSide(
        //           color: Colors.black
        //       )
        //   ),
        // ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.black,
        )
    );
  }
}