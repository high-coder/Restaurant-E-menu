import 'package:flutter/material.dart';

class TopAnimtaion extends StatefulWidget {
  @override
  _TopAnimtaionState createState() => _TopAnimtaionState();
}

class _TopAnimtaionState extends State<TopAnimtaion> {
  double x = 170;
  double y = -200;
  double z = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: TweenAnimationBuilder(
        duration: Duration(seconds: 1),
        tween: Tween<Offset>(begin: Offset(200,-150), end: Offset(0,100)),
        curve: Curves.decelerate,
        builder: (_, Offset angle, __) {
          return Transform.translate(offset: angle,
          child: Image.asset("assets/images/pizza/1.png"),
          );
        },
      ),
    );
  }
}
