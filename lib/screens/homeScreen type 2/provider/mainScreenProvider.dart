import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/models/basketModel.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/models/categories.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/models/featuredfoodModel.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/models/gridViewModel.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/models/productsData.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';

class MainScreenProvider extends ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final StorageReference _reference = FirebaseStorage.instance.ref();
  List productAll = [];
  List categoryList = [];
  List FeaturedItemsId = [];
  List FeaturedFood = [];  // this is the list that contains the featuredItems list
  List ImageUrls = [];  // It contains all the converted image urls from firebase
  List gridViewList = [];
  List<BasketModel> basket = [];
  bool isInitFirstTime = true;
  Future categoryFuture;
  Future FeaturedProducts;
  Future getCategoryFood;
  //StorageReference _reference = FirebaseStorage.instance.ref();

  // Future<String> getImage(url) async {
  //   String img;
  //   await _reference.child(url).getDownloadURL().then((value) {
  //     img = value;
  //   });
  //   print(img);
  //   return img;
  // }

  // Step 2: We modified the url property of the products list here and copied the products list to the basket list which will help only for ui portion
  getImageUrl() async {
    for(int i=0;i<productAll.length;i++){
      await _reference.child(productAll[i].url).getDownloadURL().then((value){
        //print(value);
        productAll[i].url = value;
        basket.add(BasketModel(
          name: productAll[i].name,
          id: productAll[i].id,
          quantity: 0,
          isFirstTime: true,
        ));
        //ImageUrls.add(value);
      });
    }
    //print("=============================================================urls");
    //print(ImageUrls.length);
    print(basket);
    return ImageUrls;
  }



  getCategory() async {
    categoryList.clear();
    print("==========================================");
    await _firestore.collection("menu").doc('category').get().then((value) {
      value.data().forEach((key, value) {
        categoryList.add(CategoryModel(name: key.toString(), productsId: value));
        // categoryModel will now also contain the product ids
        //print(key.toString());
        //print("above value =============================================");
        //print(value);
      });
    });
    //print(categoryList[0].productsId);
    //convertCategory();
    //notifyListeners();
    print(categoryList.length);
    return categoryList;

  }

  sendToProvider2() async{

  }

  loadAllData() async {
    await getProduct();   //It will load all the products from the firebase in the productsall list
    print("First await done");
    await getImageUrl(); // It will update the url property of the product list fetched in the first step
    print("Second await done");
    await getCategory();  // It will Load the categories to be added below the featured container
    print("Third await done");
    //return categoryList;
    categoryFuture = getCategoryForFutureBuilder();
    //categoryFuture = providerInstance.getCategory();
    getCategoryFood =  convertCategory(name: "Burger");

  }

  getCategoryForFutureBuilder() async{
    return categoryList;
  }



//String name= "Burger";
  convertCategory({String name}) async{
    gridViewList.clear();
    // int i=0;
    // int j = 0;
    // bool pass = false;
    // //await getCategory();
    // print("Inside convert category");
    // print(categoryList.length);
    // categoryList.forEach((element) {
    //   //print(element);
    //   if(name == categoryList[i].name || pass == true){
    //     pass = true;
    //    // print(categoryList[i].productsId);
    //     categoryList[i].productsId.forEach((id){
    //       print(id);
    //       if(j==productAll.length){
    //         print("Do nothing");
    //       }
    //       else if(productAll[j].id == id.toString()){
    //         gridViewList.add(
    //           GridViewModel(
    //             name: productAll[i].name,
    //             id: id.toString(),
    //             price: productAll[i].price,
    //             rating: productAll[i].rating,
    //             wishlist: true,
    //             url: productAll[i].url,
    //
    //           )
    //         );
    //         print("Id found");
    //         j++;
    //       }
    //     });
    //     print("name found");
    //     print(i);
    //   }
    //   else{
    //     i++;
    //   }
    // });
    // for(int i=0;i<categoryList.length;i++){
    //   debugPrint("this is that");
    //   print(i);
    //   if(categoryList[i].productsId.isEmpty){
    //     print(" null");
    //   }
    //   else{
    //     print("not Null");
    //     print(categoryList[i].productsId);
    //     for(int j=0;j<categoryList[i].productsId.length;j++){
    //       print("Inside the for loop");
    //       print(productAll[i].id);
    //       if(categoryList[i].productsId[j].toString() == productAll[i].id.toString()){
    //         print("Inside the if statement ${j}");
    //         gridViewList.add(
    //             GridViewModel(
    //             name: productAll[i].name,
    //             id: productAll[i].id,
    //             wishlist: true,
    //             price: productAll[i].price,
    //             url: productAll[i].url,
    //             rating: productAll[i].rating,
    //           )
    //         );
    //       }
    //       print(categoryList[i].productsId[j]);
    //     }
    //   }
    //
    // }
    // print(gridViewList[0]);
    categoryList.forEach((element) {
      if (element.name == name) {
        print("Inside the convert cateogry function");
        element.productsId.forEach((value) {
          for (int i = 0; i < productAll.length; i++) {
            if (productAll[i].id.toString() == value.toString()) {
              gridViewList.add(FeatureFood(
                  name: productAll[i].name,
                  id: productAll[i].id,
                  url: productAll[i].url,
                  price: productAll[i].price,
                  wishlist: false));
            }
          }
        });
      }
    });

    notifyListeners();
    return gridViewList;

  }
  // Abhi code for getting the list with specific category

  // category.forEach((element) {
  // if (element.name == name) {
  // element.items.forEach((value) {
  // for (int i = 0; i < products.length; i++) {
  // if (products[i].id.toString() == value.toString()) {
  // GridFood.add(gridContainerModel(
  // name: products[i].name,
  // id: products[i].id,
  // url: products[i].url,
  // price: products[i].price,
  // wishlist: false));
  // }
  // }
  // });
  // }
  // });
  //

  getFeatured() async {
    //print("THis is tha t--------------------------------------------------------");
    //print(productAll.length);
    FeaturedFood.clear();
    await _firestore
        .collection('menu')
        .doc('FeaturedItems')
        .get()
        .then((value) => value.get('Items').forEach((value) {

      for (int i = 0; i < productAll.length; i++)
        {
        //print(productAll[i].id);
        //print(value);
       // print("this is shihf{f------------------------");
        if (value.toString() == productAll[i].id) {
          //print("Inside if statement");

          FeaturedFood.add(FeatureFood(
              id: productAll[i].id,
              name: productAll[i].name,
              price: productAll[i].price,
              rating: productAll[i].rating,
              url: productAll[i].url,
              wishlist: true));
        }
      }
    }));
    //print("above the listenersssssssssssss---------------------------");
    notifyListeners();
    //print(FeaturedFood.length);
    return FeaturedFood;
  }

  // getFeatured() async {
  //   await _firestore
  //       .collection("menu")
  //       .doc('FeaturedItems')
  //       .get()
  //       .then((snapShot) {
  //         snapShot.get('Items').forEach((value){
  //           for(int i=0; i<productAll.length;i++) {
  //             print("Indside the loop ${i}");
  //             print(value);
  //             //print(value.toString);
  //             if(value.toString() == productAll[i].id) {
  //               print("this si that ");
  //               print("this is working");
  //             }
  //           }
  //         });
  //   });
  //   return FeaturedItemsId;
  // }

  getProduct() async {
    productAll.clear();
    String url;
    await _firestore.collection("menu").doc('Products').get().then((snapshot) {
      snapshot.data().forEach((key, value) {
        url = value['url'];
        productAll.add(ProductsData(
            id: key.toString(),
            name: value['name'],
            price: value['price'],
            rating: value['rating'],
            url: value['url'],
            min: value['min'],
            addons: value['add-ons'],
            description: value['desc'],
            isFirstTime: true,
            quantity: 0,
        ));
        //print("above -----------------------------------------");
        //print(key);
        //print(value['name']);
      });
    });
   // print("Above====================================");
    //print(productAll.length);
    //print(productAll[0].url);
    return productAll;
  }
}
