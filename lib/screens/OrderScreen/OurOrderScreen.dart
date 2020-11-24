import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OurOrderScreen extends StatefulWidget {
  @override
  _OurOrderScreenState createState() => _OurOrderScreenState();
}

class _OurOrderScreenState extends State<OurOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Lottie.asset("assets/Lottie/cooking.json"),
            Container(
              child:Text("Preparing..", style: TextStyle(fontFamily: 'Montserrat', fontSize: 20,),),
            ),
          ],
        ),
      ),
    );
  }
}
