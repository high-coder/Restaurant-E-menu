import 'package:flutter/material.dart';


enum CategoryType {
  pizza,
  burger,
  noodles,
  desert,
  drink,
  pasta,
}

// this is the basic model for the Categories widget that is the icons of the burger and all
class Categories{
  final String name;
  final String imageLocation;
  final CategoryType categoryType;

  const Categories({
    @required this.name,
    @required this.imageLocation,
    this.categoryType,
  });
}