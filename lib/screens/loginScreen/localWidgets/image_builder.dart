import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final int index;
  List<String> _images = ["assets/images/LoginPage/1.png",
    "assets/images/LoginPage/2.png",
    "assets/images/LoginPage/3.png"];
  ImageContainer(this.index);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Image(
            width: 220,
            height: 220,
            image: AssetImage(_images[index]),
          ),
        ),
        SizedBox(width: 50,)
      ],
    );
  }
}
