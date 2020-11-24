import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerForCategories extends StatelessWidget {
  int _offSet = 0;
  int _time = 800;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6, // list length
        itemBuilder: (context, index) {
          print("Rebuilding ...........................................");
          _offSet +=20;
          _time = 800+_offSet;
          return Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey[300],
            period: Duration(milliseconds: _time),

            child: Container(
              //padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(
                right: 20,
              ),
              width: 80,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 70,
                    width: 70,
                    //padding:EdgeInsets.only(top: 15),

                    //child: Image.asset(menuCategories[index].imgLocation),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    // width: 30,
                    // height: 20,
                    color: Colors.red,
                  ),
                  //child: Text(menuCategories[index].name)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
