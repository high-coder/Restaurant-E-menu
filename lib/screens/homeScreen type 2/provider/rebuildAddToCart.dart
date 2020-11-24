import 'package:flutter/cupertino.dart';

class RebuildAddToCart extends ChangeNotifier{
  void getId(id, List products, index) {
    if(id == products[index].id){
      print("Id is matched");
      notifyListeners();
    }
  }
}