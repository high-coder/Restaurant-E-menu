import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class PageViewFood extends StatefulWidget {
  @override
  _PageViewFoodState createState() => _PageViewFoodState();
}

class _PageViewFoodState extends State<PageViewFood> {
  int _currentPage = 0;
  List<String> images = ["assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png"];

  PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,

    );
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(seconds: 10),
        curve: Cubic(0.5,0.6,0.7,1.0),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (context,i) {

                return imageSlider(i);
              }
        ),
    );
  }

  imageSlider(int position) {
    return AnimatedBuilder(
        animation: _pageController,
        builder: (context,widget){
          return SizedBox(
            height:220,
            width:220,
            child: widget,
          );
        },
        child: Container(
          //padding: EdgeInsets.all(0),
          //margin: EdgeInsets.all(0),
          child: Image(
            fit: BoxFit.contain,
            image: AssetImage(images[position],),
          ),
        )
    );
  }
}
