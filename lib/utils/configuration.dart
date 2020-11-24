import 'package:flutter/material.dart';


TextStyle textStyleCustom = TextStyle(fontFamily: 'Montserrat',
fontSize: 20, fontWeight: FontWeight.bold );
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300],
  blurRadius: 10,
  spreadRadius: 3,
  offset: Offset(0,2)
  ),
];

// this contains the list of the names and the paths of the images
List<Map> categories = [
  {'name' : 'Pizzas' , 'path' : 'assets/images/menu-subheads/pizza.png'},
  {'name' : 'Burger' , 'path' : 'assets/images/menu-subheads/burger.png'},
  {'name' : 'Desert' , 'path' : 'assets/images/menu-subheads/desert.png'},
  {'name' : 'Pasta' , 'path' : 'assets/images/menu-subheads/pasta.png'},
  {'name' : 'Noodle' , 'path' : 'assets/images/menu-subheads/noodle.png'},
];


List<Map> pizzaCategories = [
  {'name' : '5 Pepper', 'path' : 'assets/images/pizza/1.png'},
  {'name' : 'Mexican', 'path' : 'assets/images/pizza/2.png'},
  {'name' : 'Onion', 'path' : 'assets/images/pizza/3.png'},
  {'name' : 'Tomato', 'path' : 'assets/images/pizza/4.png'},
  {'name' : 'Paneer', 'path' : 'assets/images/pizza/5.png'},
  {'name' : 'Cheese', 'path' : 'assets/images/pizza/6.png'},
  {'name' : 'Chicken', 'path' : 'assets/images/pizza/7.png'},
];