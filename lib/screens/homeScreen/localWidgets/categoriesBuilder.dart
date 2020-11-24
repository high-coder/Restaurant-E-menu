import 'package:flutter/material.dart';

class CategoriesBuilder extends StatelessWidget {

  final int selectedIndex;
  final int index;
  final String name;
  final String imageLocation;

  const CategoriesBuilder({Key key, this.selectedIndex, this.index, this.name,this.imageLocation}) : super(key: key);@override
  Widget build(BuildContext context) {
   // print(menuCategories);
    return Container(
      //padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(
        right: 20,
      ),
      width: 80,
      height: 90,
      decoration: BoxDecoration(
          color: selectedIndex != null &&
              selectedIndex == index
              ? Theme.of(context).primaryColor
              : Colors.white,
          //color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          )),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            padding: EdgeInsets.only(top: 15),
            child: Image.asset(
                imageLocation),
          ),
          Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                  name)),
        ],
      ),
    );
  }
}
