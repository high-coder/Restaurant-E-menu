import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/models/basketModel.dart';
import 'package:final_wala_final_pka/screens/homeScreen%20type%202/models/featuredfoodModel.dart';
import 'package:flutter/cupertino.dart';

class AddToCartProvider extends ChangeNotifier{
  Dio dio = Dio();
  List basket= [];  // this list will contain the id along with the quantity of the each item to be added
  List<BasketModel> cart = []; // Now this list will be used to build the ui and every logic!!
  int orderTotalValue = 0;
  double tax = 0;
  bool isScreenDisable = false;
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;
  //int quantity = 1;
  //bool isFirstTime = true;
  firstTime(FeatureFood item) {
    bool check1 = true;
    bool check2 = false;
    item.quantity = 1;
    if(check1) {
     // print("Entering the first if statement");
      if (cart.isNotEmpty) {
        cart.forEach((element) {
          if (element.id == item.id) {
            check2 = false;
            //print("duplicacy of data is not allowed");
          }
          else {
            //print("this is that");
            check2 = true;
          }
        });
      }
      else{
        check2=true;
      }

    }
    if(check2) {
      //print("Entering the second if statement");
      cart.add(BasketModel(
        //index: index,
        name: item.name,
        url: item.url,
        price: item.price,
        id: item.id,
        quantity: item.quantity,
        isFirstTime: false,
      ));

      // basket.forEach((element) {
      //   if(element.id == item.id) {
      //     //print("The id is matched");
      //     element.quantity =1;
      //     element.isFirstTime = false;
      //     //print(element.quantity);
      //
      //   }
      // });

      //basket[index].quantity = 1;
      //print("Printing");
      //basket[index].isFirstTime = false;
      //print("this is tha thoihdiohggoihsgiohsdgiohsddioghsdoi");
      //print(basket.contains(item.id, element));

    }
    orderTotal(); // this function is to be called everytime something in the cart list has been changed
    notifyListeners();

  }
  increment(String id) {
    orderTotal();

    cart.forEach((element) {
      if(element.id == id) {
       // print("The id is matched");
        element.quantity += 1;
      }
    });

    // Will match the id and where the id matches will update the quantity
    // basket.forEach((element) {
    //   if(element.id == id) {
    //      //print("The id is matched");
    //     element.quantity += 1;
    //     //print(element.quantity);
    //
    //   }
    // });
    //basket[index].quantity = basket[index].quantity + 1;
    orderTotal(); // this function is to be called everytime something in the cart list has been changed
    notifyListeners();
    //print(basket[index].quantity);
  }


  /// Correct this function this is wrong
  decrement(String id){
    cart.forEach((element) {
      if(element.id == id) {
        if(element.quantity >1){
          element.quantity -=1;
          orderTotal(); // this function is to be called everytime something in the cart list has been changed
          notifyListeners();
        } else{
          try{
            //cart.forEach((element3) {
              //if(element3.id == id) {
              //   cart.remove(element);
              //   orderTotal();
              //   notifyListeners();
              removeItem(0,id);
                //element.quantity = 0;
                //element.isFirstTime = true;// making the quantity of the element in the basket list also zero
              //}
            //});
          } catch(e) {
            //print("In the catch of the functioun");
          }
        }
      }
    });

    //print(cart);
  }

  // this function will be called whenever the quantity is 1
  removeItem(int index, String id) {
    try {
      cart.forEach((element) {
        if (element.id == id) {
          cart.remove(element);
         // print(cart);
        }
      });
    } catch(e){
      //print("in the catch");
    }

    //basket[index].isFirstTime = true;
    orderTotal(); // this function is to be called everytime something in the cart list has been changed
    notifyListeners();
  }

  orderTotal() {
    print("this is entering order total function ==========================");
    orderTotalValue = 0;
    //print("Inside the order total ");
    cart.forEach((element) {
      orderTotalValue += element.price * element.quantity;
    });
    tax = 0.05 * orderTotalValue;
    tax = tax.roundToDouble();
    //print(orderTotalValue);
  }


  placeOrder() async{
    //print("Inside the place order function");
    isScreenDisable = true;
    //print("===================================================================");
    notifyListeners();
    String retVal = "success";
    String uid = "this";
    Map abc = {};
    Map productId = {};
    int orderNumber;
    await _firebase.collection('currentOrder').get().then((value){
      //orderNumber = value.docs.length + 2;
      orderNumber = 9600+value.docs.length + 1;
    });
    await _firebase.collection('currentOrder').doc(orderNumber.toString()).set({});

    cart.forEach((element) {
      //productId['id'] = element.id;
      Map product ={};
      product['name'] = element.name;
      product['url'] = element.url;
      product['quantity'] = element.quantity;
      product['orderedTime'] = DateTime.now();
      product['inProgress'] = true;
      product['delivered'] = false;
      product['price'] = element.price;
      abc[element.id] =  product;
    });

    try {
      await _firebase.collection('currentOrder')
          .doc(orderNumber.toString())
          .set({
        uid: abc,
      })
          .then((value) {
        retVal = "success";
      });
    } catch(e) {
      retVal = "error";
    }
    // cleared the basket list will be updated and the cart list will be cleared
  if(retVal == "success") {
    //Navigator.of(context)
    cart.clear();
    orderTotal(); // this function is to be called everytime something in the cart list has been changed
    notifyListeners();
    //print("Exiting the funtcion");
    // await dio.get(
    //     "https://gurubrahma-smsly-sms-to-india-v1.p.rapidapi.com/sms/transactional/${user.phoneNumber.substring(3)}/Thanks%20for%20Ordering%20from%20TasteAtlas.%0AOrder%20Details%20.....%0ATotal%20item%20%3D%20${cart.length}.%0ATotal%20Amount%20%3D%20$total%2C%0AYour%20order%20will%20be%20on%20your%20table%20within%20in%2020%20minutes..%0AHappy%20a%20nice%20day",
    //     options: Options(headers: {
    //       "content-type": "application/xml",
    //       "x-rapidapi-key":
    //       "19d15ec7fcmshc65f9f710ed08c6p1eb495jsna131144d59a4",
    //       "x-rapidapi-host": "gurubrahma-smsly-sms-to-india-v1.p.rapidapi.com",
    //       "useQueryString": true
    //     }));
    isScreenDisable = false;
    return retVal;
  }
  else {
    //print("Exiting the funtcion");
    isScreenDisable = false;
    return retVal;
  }

  //return retVal;

  }


}