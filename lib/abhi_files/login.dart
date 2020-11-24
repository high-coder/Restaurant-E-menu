import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'contants.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        backgroundColor: kbackground,
        body: Stack(alignment: Alignment.bottomCenter, children: [
          ClipPath(
            clipper: paintit(),
            child: SingleChildScrollView(
              child: Container(
                width: size.width,
                height: size.height,
                color: kforeground,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [SizedBox(height: size.height/2,),
                    Text(
                        'login',
                        style: TextStyle(
                            color: textcolor,
                            fontSize: 20,
                            fontFamily: 'Ubuntu',fontWeight: FontWeight.bold)
                    ),
                    SizedBox(
                      height: 50,
                    ),

                    // Here begins the text field of the phone number
                    Container(
                      width: size.width - 50,
                      padding: EdgeInsets.only(
                          left: kpadding * 10, right: kpadding * 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: Colors.white, style: BorderStyle.solid)),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.phone,
                              color: iconcolor,
                            ),
                            hintText: 'Enter your Phone',
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintStyle:
                            TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 50,
                      //minWidth: size.width / 2,
                      width: double.infinity,
                      child: FlatButton(
                        color: iconcolor,
                        //height: 50,
                        //minWidth: size.width / 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        onPressed: () {},
                        child: Text('Submit'),

                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Need help.....?',
                        style: TextStyle(
                            color: textcolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: Image.asset(
              'asserts/images/indian.png',
              width: size.width - 100,
            ),
            top: size.height / 3 - 150,
          ),
        ]));
  }
}

class paintit extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var endPoint = Offset(0, size.height / 3);
    var controlPoint = Offset(size.width / 2, size.height / 3 - 200);
    var controlPoint2 = Offset(size.width / 2, size.height / 3 + 150);

    Path path = Path()
      ..moveTo(0, endPoint.dy) // first
      ..lineTo(0, size.height) // second
      ..lineTo(size.width, size.height) // third
      ..lineTo(size.width, size.height / 3)
      ..cubicTo(controlPoint.dx, controlPoint.dy, controlPoint2.dx,
          controlPoint2.dy, endPoint.dx, endPoint.dy)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
