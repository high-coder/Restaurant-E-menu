import 'package:flutter/material.dart';

import 'categoriesModels.dart';


// This will tell about the type of the category


class FoodSpecificCategory{
  final String id;
  final String name;
  //final Category_type categoryEnum;
  final String price;
  final String originalPrice;
  //final String rating;
  final bool wishlist;
  //final Categories categoryDetails;
  final String imageLocationC;

  const FoodSpecificCategory({
    @required this.name,
    //@required this.categoryEnum,
    @required this.price,
    @required this.originalPrice,
   // @required this.rating,
    @required this.wishlist,
    //@required this.categoryDetails,
    @required this.imageLocationC,
    @required this.id

  });
}