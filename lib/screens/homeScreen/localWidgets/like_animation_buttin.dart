import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LikeButtonCustom extends StatefulWidget {
  @override
  _LikeButtonCustomState createState() => _LikeButtonCustomState();
}

class _LikeButtonCustomState extends State<LikeButtonCustom>
    with SingleTickerProviderStateMixin {
  AnimationController
      _controller; // Step 1 is to declare a animation controller
  Animation<double> _animationFloatUp;
  Animation<double> _animationGrowSize;

  bool isTapped = false;
  Color iconColor = Colors.black;
  double _balloonHeight;
  double _balloonWidth;
  double _balloonBottomLocation;

  _changeAnimation() {
    Size size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    double screenHeigh = size.height;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    _balloonHeight = MediaQuery.of(context).size.height / 2;
    _balloonWidth = MediaQuery.of(context).size.height / 3;
    _balloonBottomLocation =
        MediaQuery.of(context).size.height - _balloonHeight;
    print(_balloonBottomLocation);
    print(_balloonHeight);

    _animationFloatUp = Tween(begin: _balloonBottomLocation, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    _animationGrowSize = Tween(begin: 50.0, end: _balloonWidth).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.75, curve: Curves.elasticInOut),
      ),
    );

    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    //print("---------------------------------------------------");
    //  return AnimatedBuilder(
    //    animation: _animationFloatUp,
    //    builder: (context, child) {
    //      //print("===================================================");
    //      return Container(
    //        child: child,
    //
    //        margin: EdgeInsets.only(
    //          top: _animationFloatUp.value,
    //          left: _animationGrowSize.value *0.25,
    //        ),
    //        width: _animationGrowSize.value,
    //      );
    //    },
    //    child: Container(
    //      color: Colors.blue,
    //      width: 50,
    //      height: 50,
    //      //color: Colors.red,
    //      child: GestureDetector(
    //        onTap: () {
    //          if(_controller.isCompleted) {
    //            _controller.reverse();
    //          } else{
    //            _controller.forward();
    //          }
    //          setState(() {
    //            isTapped = !isTapped;
    //            print("this is that");
    //            iconColor = Colors.red;
    //            _changeAnimation();
    //          });
    //
    //        },
    //        child: Container(
    //          //color:Colors.green,
    //          child: Icon(isTapped ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart, color: iconColor,size: _balloonWidth,),
    //          height: _balloonHeight,
    //          width: _balloonWidth,
    //        ),
    //      ),
    //    ),
    //  );
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: Colors.red,
            child: Column(
              children: [
                AnimatedBuilder(
                  animation: _animationFloatUp,
                  builder: (context, child) {
                    return Container(
                      color: Colors.blue,
                      child: child,
                      margin: EdgeInsets.only(
                        top: _animationFloatUp.value,
                        left: _animationGrowSize.value * 0.25,
                      ),
                      //width: _animationGrowSize.value,
                    );
                  },
                  child: Container(
                    //margin: EdgeInsets.all(100),
                    //padding: EdgeInsets.all(100),
                    //color: Colors.blue,
                    child: GestureDetector(
                      onTap: () {
                        if (_controller.isCompleted) {
                          _controller.reverse();
                        } else {
                          _controller.forward();
                        }
                        setState(() {
                          isTapped = !isTapped;
                          print("this is that");
                          iconColor = Colors.red;
                          _changeAnimation();
                        });
                      },
                      child: Icon(FontAwesomeIcons.heart),
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  bottom: 10,
                  left: 200,
                  child: Container(
                    child: GestureDetector(
                      onTap: () {
                        if (_controller.isCompleted) {
                          _controller.reverse();
                        } else {
                          _controller.forward();
                        }
                        setState(() {
                          isTapped = !isTapped;
                          print("this is that");
                          iconColor = Colors.red;
                          _changeAnimation();
                        });
                      },
                      child: Icon(FontAwesomeIcons.heart),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
