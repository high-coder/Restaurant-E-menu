import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/models/featuredfoodModel.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/provider/mainScreenProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FeatureProvider extends ChangeNotifier{
  //List copyProductsList= [];

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List FeaturedFood = [];

  //MainScreenProvider instance = MainScreenProvider();
  // Step 5
  // It takes the products list, then it will await the ids for featured items from firebase and instantly match then from the products list
  // and then add them to the featured list which will then be used by the mainScreen Future Builder to build the featured Container
  // It will be returned to the homeScreen FeaturedProducts
  getFeatured(List products) async {
    print(products);
    MainScreenProvider instance = MainScreenProvider();
    print("THis is tha t--------------------------------------------------------");
    //print(productAll.length);
    //print(instance.productAll);
    FeaturedFood.clear();
    await _firestore
        .collection('menu')
        .doc('FeaturedItems')
        .get()
        .then((value) => value.get('Items').forEach((value) {

      for (int i = 0; i < products.length; i++)
      {
        //print(productAll[i].id);
        //print(value);
        // print("this is shihf{f------------------------");
        if (value.toString() == products[i].id) {
          FeaturedFood.add(FeatureFood(
              id: products[i].id,
              name: products[i].name,
              price: products[i].price,
              rating: products[i].rating,
              url: products[i].url,
              wishlist: true,
              isFirstTime: products[i].isFirstTime,
              quantity: products[i].quantity,
          ));
        }
      }
    }));
    //print("above the listenersssssssssssss---------------------------");
    //print(FeaturedFood.length);
    print(FeaturedFood);
    notifyListeners();
    return FeaturedFood;
  }
}