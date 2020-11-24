import 'package:final_wala_final_pka/screens/homeScreen/localWidgets/like_animation_buttin.dart';
import 'package:final_wala_final_pka/utils/configuration.dart';
import 'package:flutter/material.dart';

class MenuSpecificBuilder extends StatelessWidget {
  final String price;
  final String originalPrice;
  final String imageLocation;
  final String name;

  const MenuSpecificBuilder({
    @required this.price,
    @required this.imageLocation,
    @required this.originalPrice,
    @required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    print(name);

    return Container(
        //padding: EdgeInsets.all(10),
        child: Container(
      //margin: EdgeInsets.only(bottom: 20),
      //padding: EdgeInsets.all(10),
      height: size.height * 0.2 - 20,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: shadowList,
          // boxShadow: [
          //   BoxShadow(
          //       offset: Offset(0, 1),
          //       blurRadius: 40,
          //       spreadRadius: 2,
          //       color: Colors.grey.withOpacity(0.5))
          // ],
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height * 0.2,
            width: size.width / 3,
            child: Image.asset(imageLocation),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(name),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    price,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    originalPrice,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Container(
                //color: Colors.red,
                width: 60,
                child: ClipPath(
                  clipper: rating(),
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    width: 40,
                    height: 60,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Icon(Icons.star_half),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(2, 5, 13, 0),
                            child: Text('4.5'),
                          ),
                          Spacer()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top:10, right: 10,),
                child: LikeButtonCustom(),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    ));
    return Column(
      children: [
        Text(name),
        Text(price),
        Text(originalPrice),
        Text(imageLocation),
      ],
    );
  }
}

class rating extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final endPoint = Offset(size.width, size.height);
    final controlPoint = Offset(size.width / 2, size.height / 2);
    Path path = Path()
      ..moveTo(10, 0)
      ..lineTo(0, 60)
      ..lineTo(25, 50)
      ..lineTo(45, 60)
      ..lineTo(35, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
