import 'package:final_wala_final_pka/utils/configuration.dart';
import 'package:flutter/material.dart';

class PizzaContainer extends StatelessWidget {
  final int index;
  PizzaContainer(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: 400,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: shadowList,
      ),
      child: Row(
        children: [
          Container(
              width:100,
              height: 70,
              child: Image.asset(pizzaCategories[index]['path'])
          ),
          Text(pizzaCategories[index]['name']),

        ],
      ),
    );
  }
}
