import 'package:flutter/material.dart';

import 'categoriesModels.dart';


// This will tell about the type of the category
enum Category_type{
  pizza,
  burger,
  desert,
  noodles,
  pasta,
}

class CustomCategory{
  final String name;
  final Category_type categoryEnum;
  final String price;
  final String originalPrice;
  final String rating;
  final bool wishlist;
  //final Categories categoryDetails;
  final String imageLocationC;

  const CustomCategory({
    @required this.name,
    @required this.categoryEnum,
    @required this.price,
    @required this.originalPrice,
    @required this.rating,
    @required this.wishlist,
    //@required this.categoryDetails,
    @required this.imageLocationC,

  });
}