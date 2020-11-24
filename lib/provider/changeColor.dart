import 'package:flutter/cupertino.dart';

class ChangeColor extends ChangeNotifier{
   int changeColor({int index, int selectedIndex}) {
    selectedIndex = index;
    notifyListeners();
    return selectedIndex;
  }

}